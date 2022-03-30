if(width != window_get_width() or height != window_get_height()) {
	ResizeScreen(window_get_width(),window_get_height());
	width = window_get_width();
	height = window_get_height();
}