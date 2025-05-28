{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "angle": 0,
        "type": "Statechart",
        "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
        "linkable": false,
        "z": 1,
        "attrs": {
          "name": {
            "text": "Sensor_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface: \n    in event EV_BTN_PUSHED\n    in event EV_BTN_RELEASED"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 211,
          "y": 160
        },
        "size": {
          "width": 86.421875,
          "height": 60
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 38,
        "attrs": {
          "name": {
            "text": "BTN_RELEASED"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 246.7109375,
          "y": 82
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "z": 40,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
        ],
        "attrs": {
          "name": {
            "fill": "#555555"
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 246.7109375,
          "y": 97
        },
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 41,
        "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
        "z": 42,
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 610,
          "y": 237
        },
        "size": {
          "width": 72.015625,
          "height": 60
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "133c53d0-4ff4-4548-967c-03dd2771f885",
        "z": 45,
        "attrs": {
          "name": {
            "text": "PUSH_CHECK"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "133c53d0-4ff4-4548-967c-03dd2771f885"
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 41.01094055175781,
              "dy": 59,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_RELEASED"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5ea70069-6bd1-4e29-915d-10416d000109",
        "z": 46,
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 392,
          "y": 160
        },
        "size": {
          "width": 122.421875,
          "height": 60
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "f30f6ae0-e9a5-4a08-a03f-dd45116f6a38",
        "z": 47,
        "embeds": [],
        "attrs": {
          "name": {
            "text": "BTN_BEEING_PUSHED"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "f30f6ae0-e9a5-4a08-a03f-dd45116f6a38"
        },
        "target": {
          "id": "133c53d0-4ff4-4548-967c-03dd2771f885",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 25,
              "dy": 34.14582824707031,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "after 1 s"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c0559f59-d878-4271-b84a-fade0d24e4b5",
        "z": 48,
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "target": {
          "id": "f30f6ae0-e9a5-4a08-a03f-dd45116f6a38",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 6.01092529296875,
              "dy": 46,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_PUSHED"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d0cc9e37-ccd7-4c69-b364-b7a4950f61c2",
        "z": 49,
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 791,
          "y": 255
        },
        "size": {
          "width": 72.015625,
          "height": 60
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "e3edb906-9762-4155-8aef-5727bfef68ae",
        "z": 50,
        "attrs": {
          "name": {
            "text": "BTN_PUSHED"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "133c53d0-4ff4-4548-967c-03dd2771f885"
        },
        "target": {
          "id": "e3edb906-9762-4155-8aef-5727bfef68ae",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 3,
              "dy": 36.14581298828125,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_PUSHED"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "cbd8a789-4333-4808-a930-b5601a05c8f7",
        "z": 51,
        "attrs": {
          "line": {
            "strokeWidth": 4
          }
        }
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "MyFirstStatechart",
          "statemachinePrefix": "myFirstStatechart",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": "",
          "exitState": "",
          "generic": ""
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}