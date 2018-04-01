{
    "id": "58054140-abf4-4d10-9cb8-84a0a634cef4",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "exCamera",
    "IncludedResources": [
        "Sprites\\exCamera_DEMO\\Markers\\spr_ex_camera_demo_marker_bounds",
        "Sprites\\exCamera_DEMO\\Markers\\spr_ex_camera_demo_marker_point",
        "Sprites\\exCamera_DEMO\\Markers\\spr_ex_camera_demo_marker_object",
        "Sprites\\exCamera_DEMO\\spr_ex_camera_demo_player",
        "Scripts\\exCamera_DEMO\\scr_test_focus_player",
        "Scripts\\Easing\\scr_ease_in_back",
        "Scripts\\Easing\\scr_ease_in_bounce",
        "Scripts\\Easing\\scr_ease_in_circ",
        "Scripts\\Easing\\scr_ease_in_cubic",
        "Scripts\\Easing\\scr_ease_in_elastic",
        "Scripts\\Easing\\scr_ease_in_expo",
        "Scripts\\Easing\\scr_ease_in_quad",
        "Scripts\\Easing\\scr_ease_in_quart",
        "Scripts\\Easing\\scr_ease_in_quint",
        "Scripts\\Easing\\scr_ease_in_sine",
        "Scripts\\Easing\\scr_ease_inout_back",
        "Scripts\\Easing\\scr_ease_inout_bounce",
        "Scripts\\Easing\\scr_ease_inout_circ",
        "Scripts\\Easing\\scr_ease_inout_cubic",
        "Scripts\\Easing\\scr_ease_inout_elastic",
        "Scripts\\Easing\\scr_ease_inout_expo",
        "Scripts\\Easing\\scr_ease_inout_quad",
        "Scripts\\Easing\\scr_ease_inout_quart",
        "Scripts\\Easing\\scr_ease_inout_quint",
        "Scripts\\Easing\\scr_ease_inout_sine",
        "Scripts\\Easing\\scr_ease_linear",
        "Scripts\\Easing\\scr_ease_out_back",
        "Scripts\\Easing\\scr_ease_out_bounce",
        "Scripts\\Easing\\scr_ease_out_circ",
        "Scripts\\Easing\\scr_ease_out_cubic",
        "Scripts\\Easing\\scr_ease_out_elastic",
        "Scripts\\Easing\\scr_ease_out_expo",
        "Scripts\\Easing\\scr_ease_out_quad",
        "Scripts\\Easing\\scr_ease_out_quart",
        "Scripts\\Easing\\scr_ease_out_quint",
        "Scripts\\Easing\\scr_ease_out_sine",
        "Scripts\\Easing\\scr_ease_slowmo",
        "Scripts\\Easing\\scr_ease_step",
        "Fonts\\exCamera_DEMO\\fnt_ex_camera_test",
        "Objects\\obj_ex_camera",
        "Objects\\exCamera_DEMO\\Markers\\obj_ex_camera_demo_marker_point",
        "Objects\\exCamera_DEMO\\Markers\\obj_ex_camera_demo_marker_object",
        "Objects\\exCamera_DEMO\\Markers\\obj_ex_camera_demo_marker_bounds",
        "Objects\\exCamera_DEMO\\obj_ex_camera_demo_camera",
        "Objects\\exCamera_DEMO\\obj_ex_camera_demo_player",
        "Rooms\\exCamera_DEMO\\rm_ex_camera_demo"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": -1,
    "date": "2018-09-03 01:03:01",
    "description": "exCamera allows you for cameras with simple movement and effects",
    "extensionName": "",
    "files": [
        {
            "id": "ed91f7d6-39cd-4f4f-8795-ff6a882ea2ac",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "d164be89-4ade-4593-8008-8d9429f4b1e1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "ex_camera_arguments_undefined",
                    "hidden": false,
                    "value": "\"__ARGUMENTS_UNDEFINED__\""
                },
                {
                    "id": "7686dd0f-e013-4dca-ad20-550f9d8812ee",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "ex_camera_draw_target_event",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "e27208aa-6b02-4005-9043-cc3e00f6391e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "ex_camera_draw_target_gui",
                    "hidden": false,
                    "value": "1"
                }
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "exCamera.gml",
            "final": "",
            "functions": [
                {
                    "id": "6602f32a-3dcc-4c87-a68c-bb5c2e955407",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_clear_bounds",
                    "help": "ex_camera_clear_bounds(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_clear_bounds",
                    "returnType": 2
                },
                {
                    "id": "9ba69998-6389-463d-a492-4e77812c69f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_count",
                    "help": "ex_camera_count()",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_count",
                    "returnType": 2
                },
                {
                    "id": "56c8e5c0-63cf-4afd-aa86-969e5156e5cc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_create",
                    "help": "ex_camera_create(name, view, x, y, width, height, scrollX, scrollY, angle, zoom, focusInstance, limitBounds, boundX, boundY, boundWidth, boundHeight)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_create",
                    "returnType": 2
                },
                {
                    "id": "246f9080-fa0e-495f-ab3c-7f4a883e017b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_destroy",
                    "help": "ex_camera_destroy(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_destroy",
                    "returnType": 2
                },
                {
                    "id": "6e1ccc78-3153-4640-a631-55f8ddc9b39f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_fade",
                    "help": "ex_camera_fade(cameraName, alpha, duration, easing, color, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_fade",
                    "returnType": 2
                },
                {
                    "id": "d6b7bb70-5699-4534-8300-f8f01cbdaafd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_fade_in",
                    "help": "ex_camera_fade_in(cameraName, duration, easing, color, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_fade_in",
                    "returnType": 2
                },
                {
                    "id": "00a1663c-2fc3-4e71-9615-db0f878d57a1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_fade_out",
                    "help": "ex_camera_fade_out(cameraName, duration, easing, color, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_fade_out",
                    "returnType": 2
                },
                {
                    "id": "508c7efc-69a4-4c90-9f60-8a0ae6bee3af",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_flash",
                    "help": "ex_camera_flash(cameraName, intensity, duration, easing, color, blendMode, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_flash",
                    "returnType": 2
                },
                {
                    "id": "b1b707c0-4716-4c07-a8eb-dd953e0cb7cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_debug_mode",
                    "help": "ex_camera_get_debug_mode()",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_debug_mode",
                    "returnType": 2
                },
                {
                    "id": "87c7caef-d212-4d7a-9b96-8ff2f1f5fa9a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_fade_color",
                    "help": "ex_camera_get_fade_color(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_fade_color",
                    "returnType": 2
                },
                {
                    "id": "7585cc7c-6509-4c9f-8c82-afa77ce3474d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_height",
                    "help": "ex_camera_get_height(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_height",
                    "returnType": 2
                },
                {
                    "id": "7701d719-739f-4a9b-a913-11a35228b496",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_index",
                    "help": "ex_camera_get_index(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_index",
                    "returnType": 2
                },
                {
                    "id": "a30c0d17-7cc8-41ab-82d6-44b2d835fc4f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_name",
                    "help": "ex_camera_get_name(cameraIndex)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_name",
                    "returnType": 2
                },
                {
                    "id": "7300e08f-be49-4a17-811c-a807f825b49e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_safe_area",
                    "help": "ex_camera_get_safe_area(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_safe_area",
                    "returnType": 2
                },
                {
                    "id": "ec5b7e5f-5ddf-4de3-aff5-dd197397620f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_scroll_position_x",
                    "help": "ex_camera_get_scroll_position_x(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_scroll_position_x",
                    "returnType": 2
                },
                {
                    "id": "5aaabe2f-a5fb-4e05-bf33-ac7efc965b4d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_scroll_position_y",
                    "help": "ex_camera_get_scroll_position_y(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_scroll_position_y",
                    "returnType": 2
                },
                {
                    "id": "59aa389e-e11e-40fd-886f-1c944e6c41d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_tilt_angle",
                    "help": "ex_camera_get_tilt_angle(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_tilt_angle",
                    "returnType": 2
                },
                {
                    "id": "5717c297-a5f9-4e4b-9d73-17b289202d21",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_view_index",
                    "help": "ex_camera_get_view_index(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_view_index",
                    "returnType": 2
                },
                {
                    "id": "f37890bb-522e-4481-949d-33340a37afa7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_width",
                    "help": "ex_camera_get_width(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_width",
                    "returnType": 2
                },
                {
                    "id": "aa059b78-ba3a-402c-ab54-ef6c34fe907f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_x",
                    "help": "ex_camera_get_x(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_x",
                    "returnType": 2
                },
                {
                    "id": "d611d728-9918-4969-b830-62291770947d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_y",
                    "help": "ex_camera_get_y(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_y",
                    "returnType": 2
                },
                {
                    "id": "c39feb6e-d9cd-479b-a906-6a3adbd2af5a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_zoom_offset_x",
                    "help": "ex_camera_get_zoom_offset_x(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_zoom_offset_x",
                    "returnType": 2
                },
                {
                    "id": "e8faaa79-25a8-46c1-a09f-910e2c6564be",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_zoom_offset_y",
                    "help": "ex_camera_get_zoom_offset_y(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_zoom_offset_y",
                    "returnType": 2
                },
                {
                    "id": "9a14e06b-4889-432a-bd28-b082ced23742",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_get_zoom_scale",
                    "help": "ex_camera_get_zoom_scale(cameraName, normalize)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_get_zoom_scale",
                    "returnType": 2
                },
                {
                    "id": "dc83e81c-a3c9-4f3d-b5a4-a0fd76ac06e8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_initialize",
                    "help": "ex_camera_initialize()",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_initialize",
                    "returnType": 2
                },
                {
                    "id": "bf35f3ce-337f-4620-8cb4-d4869bb32f93",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_is_shaking",
                    "help": "ex_camera_is_shaking(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_is_shaking",
                    "returnType": 2
                },
                {
                    "id": "309948a9-0a02-427f-b49d-c79f6ced9bb3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_is_visible",
                    "help": "ex_camera_is_visible(cameraName)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_is_visible",
                    "returnType": 2
                },
                {
                    "id": "be49b42b-82b2-4b75-9e98-e5867b1bae22",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_resize",
                    "help": "ex_camera_resize(cameraName, x, y, width, height, duration, easing, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_resize",
                    "returnType": 2
                },
                {
                    "id": "12f864b5-0821-454f-ba9c-c344aaf1fbdc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_scroll_by",
                    "help": "ex_camera_scroll_by(cameraName, x, y, duration, easing, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_scroll_by",
                    "returnType": 2
                },
                {
                    "id": "c6952190-4dce-4387-9f91-0a1e1860d908",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_scroll_to_object",
                    "help": "ex_camera_scroll_to_object(cameraName, instanceID, duration, easing, center, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_scroll_to_object",
                    "returnType": 2
                },
                {
                    "id": "54b49b97-5426-4cfe-b533-bd9c9a82f3eb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_scroll_to_point",
                    "help": "ex_camera_scroll_to_point(cameraName, x, y, duration, easing, center, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_scroll_to_point",
                    "returnType": 2
                },
                {
                    "id": "41a75efc-6849-4416-8725-9d242e912fb3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_bounds",
                    "help": "ex_camera_set_bounds(cameraName, x, y, width, height)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_bounds",
                    "returnType": 2
                },
                {
                    "id": "988681a1-0b3e-4a14-a655-d22084bf6595",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_debug_mode",
                    "help": "ex_camera_set_debug_mode(enabled)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_debug_mode",
                    "returnType": 2
                },
                {
                    "id": "67d6eaef-d157-46fc-9c78-3e6941bd5748",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_fade_alpha",
                    "help": "ex_camera_set_fade_alpha(cameraName, alpha)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_fade_alpha",
                    "returnType": 2
                },
                {
                    "id": "468df45b-cf89-4af4-b5ad-7e9539018aa0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_fade_color",
                    "help": "ex_camera_set_fade_color(cameraName, color)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_fade_color",
                    "returnType": 2
                },
                {
                    "id": "3dafe505-ab1a-4de4-b373-299bdcdf8912",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_fade_draw_target",
                    "help": "ex_camera_set_fade_draw_target(cameraName, drawTarget)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_fade_draw_target",
                    "returnType": 2
                },
                {
                    "id": "d6bbaaf4-2c96-4a75-8a61-2770373944dd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_flash_blend",
                    "help": "ex_camera_set_flash_blend(cameraName, blendMode)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_flash_blend",
                    "returnType": 2
                },
                {
                    "id": "f96a66bc-342e-4045-a259-250a110c411f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_flash_color",
                    "help": "ex_camera_set_flash_color(cameraName, color)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_flash_color",
                    "returnType": 2
                },
                {
                    "id": "018930ea-c89a-4eea-95de-c8103e18e539",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_flash_draw_target",
                    "help": "ex_camera_set_flash_draw_target(cameraName, drawTarget)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_flash_draw_target",
                    "returnType": 2
                },
                {
                    "id": "19a7d75e-ab15-4c6e-a4c3-232631791e66",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_position",
                    "help": "ex_camera_set_position(cameraName, x, y)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_position",
                    "returnType": 2
                },
                {
                    "id": "3aae1111-466a-4b46-80eb-cb4217acc49f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_safe_area",
                    "help": "ex_camera_set_safe_area(cameraName, value)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_safe_area",
                    "returnType": 2
                },
                {
                    "id": "4c73e6a7-5017-4820-aa4a-b6f268524500",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_scroll_position_at_object",
                    "help": "ex_camera_set_scroll_position_at_object(cameraName, instanceID, center)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_scroll_position_at_object",
                    "returnType": 2
                },
                {
                    "id": "35dd280f-c4bc-4821-be7b-0c180f9f2d32",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_scroll_position_at_point",
                    "help": "ex_camera_set_scroll_position_at_point(cameraName, x, y, center)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_scroll_position_at_point",
                    "returnType": 2
                },
                {
                    "id": "23d7b03d-9923-4563-b345-fc81278f4096",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_size",
                    "help": "ex_camera_set_size(cameraName, width, height)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_size",
                    "returnType": 2
                },
                {
                    "id": "4b5a1837-7234-4d18-9004-73fb7ea78e80",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_tilt_angle",
                    "help": "ex_camera_set_tilt_angle(cameraName, value)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_tilt_angle",
                    "returnType": 2
                },
                {
                    "id": "6a529728-4012-4808-82ce-7bb789e61db6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_visible",
                    "help": "ex_camera_set_visible(cameraName, value)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_visible",
                    "returnType": 2
                },
                {
                    "id": "0467109b-32fa-4905-bb9c-cf34b883ec20",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_set_zoom_scale",
                    "help": "ex_camera_set_zoom_scale(cameraName, scale)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_set_zoom_scale",
                    "returnType": 2
                },
                {
                    "id": "6f845d96-e35c-4f54-8c1b-9fa0cfd044c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_shake",
                    "help": "ex_camera_shake(cameraName, shakeX, shakeY, shakeAngle, duration, easing, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_shake",
                    "returnType": 2
                },
                {
                    "id": "393bdbac-4f00-4e63-814d-0d0f8bddee5b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_tilt",
                    "help": "ex_camera_tilt(cameraName, value, duration, easing, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_tilt",
                    "returnType": 2
                },
                {
                    "id": "01a10987-e410-42b8-b523-eb9621644e74",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_zoom",
                    "help": "ex_camera_zoom(cameraName, scale, duration, easing, onComplete, onCompleteArguments)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_zoom",
                    "returnType": 2
                },
                {
                    "id": "7476c838-3e5e-4daf-a02a-b2313eec782e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_math_smoothstep",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_math_smoothstep",
                    "returnType": 2
                },
                {
                    "id": "190d4bed-beb9-47e1-9cd5-338f2459e47a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "ex_camera_ds_grid_delete_y",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "ex_camera_ds_grid_delete_y",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\exCamera.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "Free for commercial and non-commercial projects",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "com.alexandervrs.excamera",
    "productID": "FA34D49C494ABB042A2ED04A27E7F44D",
    "sourcedir": "",
    "version": "1.6.0"
}