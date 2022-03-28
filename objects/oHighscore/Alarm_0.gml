InputHold();

if(key_up or key_down) and selected != 3 {
	name[selected] -= key_down-key_up;
	if(name[selected] < 65) name[selected] = 90;
	else if(name[selected] > 90) name[selected] = 65;
	alarm[0] = 5;
}