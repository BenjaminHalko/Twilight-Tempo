var _xAxis, _yAxis;
for(var i = 0; i < gamepad_get_device_count(); i++) {
	_xAxis = sign(gamepad_axis_value(i,gp_axislh)+gamepad_axis_value(i,gp_axisrh));
	_yAxis = sign(gamepad_axis_value(i,gp_axislv)+gamepad_axis_value(i,gp_axisrv));
	
	if(global.rumble <= 0) gamepad_set_vibration(i,0,0);
	
	if(_xAxis != 0) {
		if(ds_map_exists(global.joystickPressedH,i)) {
			if(global.joystickPressedH[? i][1] == lastTime) global.joystickPressedH[? i] = [0,lastTime+1];
			else global.joystickPressedH[? i] = [_xAxis,lastTime+1];
		} else ds_map_add(global.joystickPressedH,i,[_xAxis,lastTime+1]);
	} else if(ds_map_exists(global.joystickPressedH,i)) global.joystickPressedH[? i] = [0,0];
		
	if(_yAxis != 0) {
		if(ds_map_exists(global.joystickPressedV,i)) {
			if(global.joystickPressedV[? i][1] == lastTime) global.joystickPressedV[? i] = [0,lastTime+1];
			else global.joystickPressedV[? i] = [_yAxis,lastTime+1];
		} else ds_map_add(global.joystickPressedV,i,[_yAxis,lastTime+1]);
	} else if(ds_map_exists(global.joystickPressedV,i)) global.joystickPressedV[? i] = [0,0];
	
	if(_xAxis != 0 or _yAxis != 0) global.lastUsedGamepad = i;
}

lastTime++;

if(keyboard_check_pressed(vk_anykey)) global.lastUsedGamepad = -1;

if(global.rumble > 0) global.rumble--;

if(width != window_get_width() or height != window_get_height()) {
	ResizeScreen(window_get_width(),window_get_height());
	width = window_get_width();
	height = window_get_height();
	
	with(oTitle) alarm[1] = 1;
	with(oPause) alarm[0] = 1;
}