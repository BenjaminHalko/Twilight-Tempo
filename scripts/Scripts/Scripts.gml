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
		draw_circle(_x-1,_y-1,_radius+i*3,false);
	}
	draw_set_alpha(_alpha);
	draw_circle(_x-1,_y-1,16,false);
	if(_alpha != 1) draw_set_alpha(1);
}

function GetHighscore() {
	if(os_type == os_operagx) {
		gxc_challenge_get_global_scores(undefined,{challengeId: global.challengeID[global.hardMode],pageSize: 1});
	}
	else {
		var _default = [2000,1000];
		ini_open("save.ini");
		global.hiScore = ini_read_real("scores",global.modeName[global.hardMode],_default[global.hardMode]);
		ini_close();
	}
}

function Input() {
	key_left_pressed = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	key_right_pressed = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	key_up_pressed = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down_pressed = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	
	key_select = keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_f4) && !keyboard_check_pressed(vk_f11) && !keyboard_check_pressed(vk_escape) && !key_left_pressed && !key_right_pressed && !key_up_pressed && !key_down_pressed;
	
	for(var i = 0; i < gamepad_get_device_count(); i++) {
		key_left_pressed = key_left_pressed || gamepad_button_check_pressed(i,gp_padl);
		key_right_pressed = key_right_pressed || gamepad_button_check_pressed(i,gp_padr);
		key_up_pressed = key_up_pressed || gamepad_button_check_pressed(i,gp_padu);
		key_down_pressed = key_down_pressed || gamepad_button_check_pressed(i,gp_padd);
		
		for(var j = gp_face1; j <= gp_face4; j++) key_select = key_select || gamepad_button_check_pressed(i,j);	
	}
	
	for(var i = ds_map_find_first(global.joystickPressedH); !is_undefined(i); i = ds_map_find_next(global.joystickPressedH,i)) {
		key_left_pressed = key_left_pressed || global.joystickPressedH[? i][0] == -1;
		key_right_pressed = key_right_pressed || global.joystickPressedH[? i][0] == 1;
	}
	
	for(var i = ds_map_find_first(global.joystickPressedV); !is_undefined(i); i = ds_map_find_next(global.joystickPressedV,i)) {
		key_up_pressed = key_up_pressed || global.joystickPressedV[? i][0] == -1;
		key_down_pressed = key_down_pressed || global.joystickPressedV[? i][0] == 1;
	}
}

function Rumble(_amount,_time) {
	global.rumble = _time;
	if(global.lastUsedGamepad != noone) gamepad_set_vibration(global.lastUsedGamepad,_amount,_amount);
}