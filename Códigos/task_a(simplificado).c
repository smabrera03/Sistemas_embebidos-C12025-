/* Project includes. */
#include "main.h"

/* Demo includes. */
#include "logger.h"
#include "dwt.h"

/* Application & Tasks includes. */
#include "board.h"
#include "app.h"

/********************** macros and definitions *******************************/
#define G_TASK_A_CNT_INI	0ul

#define TASK_A_CNT_INI		0ul
#define TASK_A_CNT_MAX		1000ul

#define TASK_A_DEL_INI		0ul
#define TASK_A_DEL_MAX		20ul

/********************** internal data declaration ****************************/

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_a 		= "Task A - Blocking Code";
//define el nombre de la tarea. Se usa para imprimir ´por log
/********************** external data declaration *****************************/
uint32_t g_task_a_cnt;

/********************** external functions definition ************************/
void task_a_init(void *parameters)
{
	/* Print out: Task Initialized */
	LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_a_init), p_task_a);

	g_task_a_cnt = G_TASK_A_CNT_INI;

	/* Print out: Task execution counter */
	LOGGER_LOG("   %s = %lu\r\n", GET_NAME(g_task_a_cnt), g_task_a_cnt);
}

void task_a_update(void *parameters)
{
	#if (TEST_X == TEST_0) //definidos en app.h

	uint32_t task_a_cnt;

	/* Update Task A Counter */
	g_task_a_cnt++;

	/* Print out: Application Update */
	LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_a_update), p_task_a);

	/* Print out: Task execution counter */
	LOGGER_LOG("   %s = %lu\r\n", GET_NAME(g_task_a_cnt), g_task_a_cnt);

	for (task_a_cnt = TASK_A_CNT_INI; task_a_cnt < TASK_A_CNT_MAX; task_a_cnt++);

	#endif

	#if (TEST_X == TEST_1)

	/* Wait for TASK_A_DEL_MAX mS */
	HAL_Delay(TASK_A_DEL_MAX);

	#endif

	#if (TEST_X == TEST_2)

	/* Here Chatbot Artificial Intelligence generated code */

	#endif
}

/********************** end of file ******************************************/
