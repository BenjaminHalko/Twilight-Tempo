if(darkness == 0) exit;

if(!surface_exists(darkSurface)) darkSurface = surface_create(room_width,room_height);

draw_surface_ext(darkSurface,0,0,1,1,0,c_white,darkness);

surface_set_target(darkSurface);
draw_clear(c_black);
gpu_set_blendmode(bm_subtract);
drawCircle(room_width/2,room_height/2,16,1);
gpu_set_blendmode(bm_normal);
surface_reset_target();