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
	
	key_select = keyboard_check_pressed(vk_anykey);
}