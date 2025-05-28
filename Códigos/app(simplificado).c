/********************** inclusions *******************************************/
/* Project includes. */
#include "main.h"

/* Demo includes. */
#include "logger.h"
#include "dwt.h"

/* Application & Tasks includes. */
#include "board.h"
#include "task_a.h"
#include "task_b.h"
#include "task_c.h"

/********************** macros and definitions *******************************/
#define G_APP_CNT_INI		0ul //zero unsigned long
#define G_APP_TICK_CNT_INI	0ul

#define TASK_X_WCET_INI		0ul
#define TASK_X_DELAY_MIN	0ul

typedef struct {
	void (*task_init)(void *);		// Pointer to task (must be a
									// 'void (void *)' function)
	void (*task_update)(void *);	// Pointer to task (must be a
									// 'void (void *)' function)
	void *parameters;				// Pointer to parameters
} task_cfg_t;
//Esto define las tareas. Cada tarea se caracteriza por tener una función de inicialización (task_init, que recibe
//un puntero a void y devuelve void), una función de actualización (task_update, idem) y parámetros

typedef struct {
    uint32_t WCET;			// Worst-case execution time (microseconds)
} task_dta_t;
/*En esta estructura se almacenan datos de la ejecución de cada tarea. En este caso solo importa el WCET, así que puede
parecer excesivo definir una estructura solo para esto, pero este código es bastante general y podría ser útil
en otros casos.
*/
/********************** internal data declaration ****************************/
const task_cfg_t task_cfg_list[]	= {
		{task_a_init, 	task_a_update, 	NULL},
		{task_b_init, 	task_b_update, 	NULL},
		{task_c_init,	task_c_update, 	NULL}
};
//lista de las tareas, a, b y c.

#define TASK_QTY	(sizeof(task_cfg_list)/sizeof(task_cfg_t))
//task quantity, cuántas tareas hay

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_sys	= " Bare Metal - Event-Triggered Systems (ETS)\r\n";
const char *p_app	= " App - retarget_printf_to_Console\r\n";

/********************** external data declaration *****************************/
uint32_t g_app_cnt; //contador de la app. cuántas veces se ejecutó
uint32_t g_app_time_us;
//variables globales.

volatile uint32_t g_app_tick_cnt;

task_dta_t task_dta_list[TASK_QTY];
/*Array de tipo task_data_t (estructura definida más arriba). Tiene tantos elementos como tareas haya.

*/
/********************** external functions definition ************************/
void app_init(void)
{
	uint32_t index;

	/* Print out: Application Initialized */
	LOGGER_LOG("\r\n");
	LOGGER_LOG("%s is running - Tick [mS] = %lu\r\n", GET_NAME(app_init), HAL_GetTick());

	LOGGER_LOG(p_sys);
	LOGGER_LOG(p_app);
    //lo de log no lo entiendo. Creo que tiene que ver con cosas que se imprimen en la consola. Investigar dsp
	g_app_cnt = G_APP_CNT_INI; //arrancamos en contador en 0.

	/* Print out: Application execution counter */
	LOGGER_LOG(" %s = %lu\r\n", GET_NAME(g_app_cnt), g_app_cnt);

	/* Go through the task arrays */
	for (index = 0; TASK_QTY > index; index++)
	{
		/* Run task_x_init */
		(*task_cfg_list[index].task_init)(task_cfg_list[index].parameters);
        /*Como extañaba los punteros 
        Esto es: para index = 0, entra en la primer tarea, llama a la función de inicialización, y le pasa los parámetros
        necesarios para inicializarla(en los tres casos no hace falta ningún parámetro, así que se les pasa NULL)
        */
		/* Init variables */
		task_dta_list[index].WCET = TASK_X_WCET_INI; //todos los WCET arrancan en 0
	}

	cycle_counter_init();
}

void app_update(void)
{
	uint32_t index;
	uint32_t cycle_counter_time_us;

	/* Check if it's time to run tasks */
	if (G_APP_TICK_CNT_INI < g_app_tick_cnt)
    {
    	g_app_tick_cnt--;

    	/* Update App Counter */
    	g_app_cnt++;
    	g_app_time_us = 0;

		/* Print out: Application execution counter */
		LOGGER_LOG(" %s = %lu\r\n", GET_NAME(g_app_cnt), g_app_cnt);

		/* Go through the task arrays */
		for (index = 0; TASK_QTY > index; index++)
		{
			cycle_counter_reset();

    		/* Run task_x_update */
			(*task_cfg_list[index].task_update)(task_cfg_list[index].parameters);

			cycle_counter_time_us = cycle_counter_time_us();

			/* Update variables */
			g_app_time_us += cycle_counter_time_us;

			if (task_dta_list[index].WCET < cycle_counter_time_us)
			{
				task_dta_list[index].WCET = cycle_counter_time_us;
			} //si se registra un peor WCET que el anterior, se actualiza
				
			/* Print out: Cycle Counter */
			LOGGER_LOG(" %s: %lu uS\r\n", GET_NAME(g_app_time_us), g_app_time_us);
		}
    }
}

void HAL_SYSTICK_Callback(void)
{
	g_app_tick_cnt++;

	g_task_c_tick_cnt++;
}

/********************** end of file ******************************************/
