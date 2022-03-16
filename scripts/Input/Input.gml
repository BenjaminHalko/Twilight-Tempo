function Input() {
	key_left_pressed = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	key_right_pressed = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	key_up_pressed = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_down_pressed = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	
	key_select = keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_f4) && !key_left_pressed && !key_right_pressed && !key_up_pressed && !key_down_pressed;
	
	for(var i = 0; i < gamepad_get_device_count(); i++) {
		key_left_pressed = key_left_pressed || gamepad_button_check_pressed(i,gp_padl);
		key_right_pressed = key_right_pressed || gamepad_button_check_pressed(i,gp_padr);
		key_up_pressed = key_up_pressed || gamepad_button_check_pressed(i,gp_padu);
		key_down_pressed = key_down_pressed || gamepad_button_check_pressed(i,gp_padd);
		
		for(var j = gp_face1; j <= gp_face4; j++) key_select = key_select || gamepad_button_check_pressed(i,j);	
	}
	
	for(var i = ds_map_find_first(global.joystickPressed); !is_undefined(i); i = ds_map_find_next(global.joystickPressed,i)) {
		key_left_pressed = key_left_pressed || global.joystickPressed[? i][0] == -1;
		key_right_pressed = key_right_pressed || global.joystickPressed[? i][0] == 1;
		key_up_pressed = key_up_pressed || global.joystickPressed[? i][1] == -1;
		key_down_pressed = key_down_pressed || global.joystickPressed[? i][1] == 1;
	}
}