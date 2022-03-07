for(var i = 0; i < array_length(stars); i++) {
	var s = stars[i];
	draw_sprite_ext(sStar,0,s.x,s.y,1,1,0,s.col,Wave(s.alpha1,s.alpha2,s.alphaSpeed,s.alphaOffset));
}