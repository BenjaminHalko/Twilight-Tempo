enableLive;

if(dead) {
	speed = 0;
	deadPercent = Approach(deadPercent,1,0.1);
	if(deadPercent == 1) instance_destroy();
}