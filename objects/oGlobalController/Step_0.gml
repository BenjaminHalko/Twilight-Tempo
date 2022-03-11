var _xAxis, _yAxis;
for(var i = 0; i < gamepad_get_device_count(); i++) {
	_xAxis = sign(gamepad_axis_value(i,gp_axislh));
	_yAxis = sign(gamepad_axis_value(i,gp_axislv));
	if(_xAxis != 0 or _yAxis != 0) {
		if(ds_map_exists(global.joystickPressed,i)) {
			if(global.joystickPressed[? i][2] == lastTime) global.joystickPressed[? i] = [0,0,current_time];
			else global.joystickPressed[? i] = [_xAxis,_yAxis,current_time];
		} else ds_map_add(global.joystickPressed,i,[_xAxis,_yAxis,current_time]);
	}
}
lastTime = current_time;

if(global.lives <= 0) global.alive = ApproachFade(global.alive,0,0.025,0.6);