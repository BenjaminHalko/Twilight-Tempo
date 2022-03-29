function Approach(a, b, amount) {
	if (a < b)
	{
	    a += amount;
	    if (a > b)
	        return b;
	}
	else
	{
	    a -= amount;
	    if (a < b)
	        return b;
	}
	return a;
}

function ApproachFade(Value,Target,MaxSpd,Ease) {
	Value += median(-MaxSpd,MaxSpd,(1-Ease)*(Target-Value));
	return Value;
}

function ApproachCircleEase(Value,Target,MaxSpd,Ease) {
	Value += median(-MaxSpd,MaxSpd,(1-Ease)*angle_difference(Target,Value));
	return Value
}

function Wave(_from, _to, _duration, _offset) {
	a4 = (_to - _from) * 0.5;
	return _from + a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * a4;
}

function drawCircle(_x,_y,_radius,_alpha) {
	for(var i = 0; i < 6; i++) {
		draw_set_alpha((0.8-i*0.1)*_alpha);
		draw_circle(_x-(os_type != os_operagx),_y-(os_type != os_operagx),_radius+i*3,false);
	}
	draw_set_alpha(_alpha);
	draw_circle(_x-(os_type != os_operagx),_y-(os_type != os_operagx),16,false);
	if(_alpha != 1) draw_set_alpha(1);
}

function Input() {
	key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	
	key_select = keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_f4) && !keyboard_check_pressed(vk_f11) && !keyboard_check_pressed(vk_escape) && !key_left && !key_right && !key_up && !key_down;
	
	for(var i = 0; i < gamepad_get_device_count(); i++) {
		key_left = key_left || gamepad_button_check_pressed(i,gp_padl);
		key_right = key_right || gamepad_button_check_pressed(i,gp_padr);
		key_up = key_up || gamepad_button_check_pressed(i,gp_padu);
		key_down = key_down || gamepad_button_check_pressed(i,gp_padd);
		
		for(var j = gp_face1; j <= gp_face4; j++) key_select = key_select || gamepad_button_check_pressed(i,j);	
	}
	
	for(var i = ds_map_find_first(global.joystickPressedH); !is_undefined(i); i = ds_map_find_next(global.joystickPressedH,i)) {
		key_left = key_left || global.joystickPressedH[? i][0] == -1;
		key_right = key_right || global.joystickPressedH[? i][0] == 1;
	}
	
	for(var i = ds_map_find_first(global.joystickPressedV); !is_undefined(i); i = ds_map_find_next(global.joystickPressedV,i)) {
		key_up = key_up || global.joystickPressedV[? i][0] == -1;
		key_down = key_down || global.joystickPressedV[? i][0] == 1;
	}
}

function InputHold() {
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	
	for(var i = 0; i < gamepad_get_device_count(); i++) {
		key_left = key_left || gamepad_button_check(i,gp_padl) || gamepad_axis_value(i,gp_axislh) < -0.5 || gamepad_axis_value(i,gp_axisrh) < -0.5;
		key_right = key_right || gamepad_button_check(i,gp_padr) || gamepad_axis_value(i,gp_axislh) > 0.5 || gamepad_axis_value(i,gp_axisrh) > 0.5;
		key_up = key_up || gamepad_button_check(i,gp_padu) || gamepad_axis_value(i,gp_axislv) < -0.5 || gamepad_axis_value(i,gp_axisrv) < -0.5;
		key_down = key_down || gamepad_button_check(i,gp_padd) || gamepad_axis_value(i,gp_axislv) > 0.5 || gamepad_axis_value(i,gp_axisrv) > 0.5;
	}
}

function AddScore() {
	ds_grid_resize(global.hiScore[global.hardMode],2,11)
	ds_grid_add(global.hiScore[global.hardMode],0,10,global.score);
	ds_grid_add(global.hiScore[global.hardMode],1,10,"-");
	ds_grid_sort(global.hiScore[global.hardMode],0,false);
	ds_grid_resize(global.hiScore[global.hardMode],2,10);
	
	for (var i = 0; i < 10; i++) if(global.hiScore[global.hardMode][# 1,i] == "-") return i;
	return 9;
}

function SaveScores(_name) {
	
	
	ini_open("scores.ini");
	ini_write_string(global.hardMode,"grid",ds_grid_write(global.hiScore[global.hardMode]));
	ini_close();
}