surface_resize(application_surface,256,224);

global.joystickPressed = ds_map_create();
global.score = 0;

window_set_size(1024/2,896/2);

for(var i = 0; i < gamepad_get_device_count(); i++) gamepad_set_axis_deadzone(i, 0.5);
lastTime = 0;

start = false;

global.bpm = 120;

room_goto_next();