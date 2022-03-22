if(darkness == 0) exit;

if(!surface_exists(darkSurface)) darkSurface = surface_create(room_width,room_height);

draw_surface_ext(darkSurface,0,0,1,1,0,c_white,darkness);

surface_set_target(darkSurface);
draw_clear(c_black);
gpu_set_blendmode(bm_subtract);
drawCircle(room_width/2,room_height/2,16,1+radius*0.7);
gpu_set_blendmode(bm_normal);
surface_reset_target();

radius = Approach(radius,0,0.1);

for(var i = 0; i < array_length(global.frontStars); i++) {
	draw_set_alpha((1-abs(1-global.frontStars[i].alpha))*darkness);
	draw_point_color(global.frontStars[i].x,global.frontStars[i].y,global.frontStars[i].col);
	draw_set_alpha(1);
	
	global.frontStars[i].alpha += global.frontStars[i].alphaSpeed;
	if(global.frontStars[i].alpha >= 2) {
		do {
			global.frontStars[i].x = irandom(room_width);
			global.frontStars[i].y = irandom(room_height);
		} until (!point_in_circle(global.frontStars[i].x,global.frontStars[i].y,room_width/2,room_height/2,16))
		global.frontStars[i].alpha = 0;
		global.frontStars[i].alphaSpeed = random_range(0.005,0.01);
	}
}