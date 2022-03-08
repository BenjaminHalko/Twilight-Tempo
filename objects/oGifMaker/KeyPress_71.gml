if(!gif) gifFile = gif_open(room_width,room_height);
else {
	var _filename = get_save_filename("Gif File|*.gif","output.gif");
	if(string_copy(_filename,string_length(_filename)-3,4) != ".gif") _filename += ".gif";
	gif_save(gifFile,_filename);
}
gif = !gif;