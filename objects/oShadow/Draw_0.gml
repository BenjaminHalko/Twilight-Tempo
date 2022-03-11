darkness = Approach(darkness,dark,0.1);

if(darkness == 0) exit;

if(!surface_exists(darkSurface)) darkSurface = surface_create(room_width,room_height);

draw_surface_ext(darkSurface,0,0,1,1,0,c_white,darkness);

surface_set_target(darkSurface);
draw_clear(c_black);
gpu_set_blendmode(bm_subtract);
for(var i = 0; i < 6; i++) {
	draw_set_alpha(0.8-i*0.1);
	draw_circle(room_width/2-1,room_height/2-1,16+i*3,false);
}
draw_set_alpha(1);
draw_circle(room_width/2-1,room_height/2-1,16,false);
gpu_set_blendmode(bm_normal);
surface_reset_target();