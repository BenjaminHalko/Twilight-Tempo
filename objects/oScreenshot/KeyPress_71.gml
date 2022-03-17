/// @desc

if(gif == noone) {
	gif = gif_open(room_width,room_height);	
} else {
	gif_save(gif,get_save_filename("*.gif",""));
	gif = noone;
}