darkness = 1-global.start;

darkSurface = surface_create(room_width,room_height);

surface_set_target(darkSurface);
draw_clear(c_black);
gpu_set_blendmode(bm_subtract);
drawCircle(room_width/2,room_height/2,16,1);
gpu_set_blendmode(bm_normal);
surface_reset_target();

stars = [];

