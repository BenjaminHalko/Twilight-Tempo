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
	
	for(var i = 0; i < gamepad_get_device_count(); i++) {
		key_left = key_left || gamepad_button_check_pressed(i,gp_padl);
		key_right = key_right || gamepad_button_check_pressed(i,gp_padr);
		key_up = key_up || gamepad_button_check_pressed(i,gp_padu);
		key_down = key_down || gamepad_button_check_pressed(i,gp_padd);
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

function InputSelect() {
	if keyboard_check_pressed(vk_anykey) and !(keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) return true;
	
	for(var i = 0; i < gamepad_get_device_count(); i++) {
		for(var j = gp_face1; j <= gp_face4; j++) if gamepad_button_check_pressed(i,j) return true;
	}
	
	return false;
}

function ResizeScreen(_newWidth,_newHeight) {
	if _newWidth < 1 and _newHeight < 1 return;
	var _ratio = _newWidth/_newHeight;
	
	var _width = MaxResolution;
	var _height = _width;
	
	if room != rGame {
		_width = (_ratio >= 0.75 ? (_ratio >= 0.85 ? (_ratio >= 0.95 ? 320 : 280) : 256) : 224);
		_height = 224;
	}
	
	if(_width/_ratio < _height) _width = round(_height*_ratio/2)*2;
	else _height = round(_width/_ratio/2)*2;
	
	camera_set_view_size(view_camera[0],_width,_height);
	camera_set_view_pos(view_camera[0],128-_width/2,112-_height/2);
	
	view_set_wport(0,_width);
	view_set_hport(0,_height);
	
	if(instance_exists(oShadow)) surface_free(oShadow.darkSurface);
	
	if(WIDTH == _width and HEIGHT == _height) exit;
	
	surface_resize(application_surface, _width, _height);
	
	for(var i = 0; i < array_length(global.stars); i++) {
		global.stars[i].x = irandom(WIDTH)+GUIX;
		global.stars[i].y = irandom(HEIGHT)+GUIY;
	}

	if global.notched {
		var _wRatio = _width/_newWidth;
		var _hRatio = _height/_newHeight;
		global.notchTop = 0;
		global.notchBottom = 0;
		global.notchLeftTop = 0;
		global.notchRightTop = 0;
		global.notchRightBottom = 0;
		
		var _dir = display_get_orientation();
		var _leftSide = NOTCH_getLeft(_dir,"") < _newWidth / 2;
		var _topSide = NOTCH_getTop(_dir,"") < _newHeight / 2;
		var _portrait = _newWidth < _newHeight;
		
		if _topSide {
			if _portrait global.notchTop = floor(NOTCH_getBottom(_dir,"")*_hRatio);
			else if _leftSide global.notchLeftTop = ceil(NOTCH_getRight(_dir,"")*_wRatio);
			else global.notchRightTop = _width-floor(NOTCH_getLeft(_dir,"")*_wRatio);
		} else {
			if _portrait global.notchBottom = _height-ceil(NOTCH_getTop(_dir,"")*_hRatio);
			else if !_leftSide global.notchRightBottom = _width-floor(NOTCH_getLeft(_dir,"")*_wRatio);
		}
	}
}

function Rumble(_amount,_time) {
	global.rumble = _time;
	if(global.lastUsedGamepad != -1) gamepad_set_vibration(global.lastUsedGamepad,_amount,_amount);
}

function SaveScore() {
	if(!global.hintMode && !global.start) {
		if global.score > global.hiScore[global.hardMode] {
			oGUI.newRecord++;
			global.hiScore[global.hardMode] = global.score;
			ini_open("save.ini");
			ini_write_real("scores",global.hardMode,global.hiScore[global.hardMode]);
			ini_close();
		}
		
		GooglePlayServices_Leaderboard_SubmitScore(global.hardMode ? HardLeaderboard : NormalLeaderboard,global.score,"");
	}
}