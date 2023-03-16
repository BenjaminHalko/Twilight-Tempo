if(width != window_get_width() or height != window_get_height()) {
	ResizeScreen(window_get_width(),window_get_height());
	width = window_get_width();
	height = window_get_height();
	
	with(oTitle) alarm[1] = 1;
	with(oPause) alarm[0] = 1;
}