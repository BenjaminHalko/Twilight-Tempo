for(var i = 0; i < array_length(stars); i++) {
	draw_set_alpha(Wave(stars[i].alpha1,stars[i].alpha2,stars[i].alphaSpeed,stars[i].alphaOffset));
	draw_point_color(stars[i].x,stars[i].y,stars[i].col);
	draw_set_alpha(1);
}