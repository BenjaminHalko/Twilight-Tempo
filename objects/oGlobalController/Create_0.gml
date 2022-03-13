surface_resize(application_surface,256,224);

global.joystickPressed = ds_map_create();
global.score = 0;
global.lives = 12;
global.alive = 1;
global.time = 0;
global.hardMode = false;

global.hiScore = 0;

global.challengeID = ["65799a4a-612d-48f9-8780-eea5057b5446","a99c7435-ffeb-4d31-b5f0-1e860a81cb86"];

global.modeName = ["normal","hard"];

window_set_size(1024/2,896/2);

for(var i = 0; i < gamepad_get_device_count(); i++) gamepad_set_axis_deadzone(i, 0.5);
lastTime = 0;

room_goto_next();