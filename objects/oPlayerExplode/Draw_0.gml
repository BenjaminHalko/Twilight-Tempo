/// @desc

if global.pause exit;

for(var i = 0; i < array_length(explodeArray); i++) {
	draw_sprite_part(sPlayer,0,explodeArray[i][0],explodeArray[i][1],1,1,explodeArray[i][2],explodeArray[i][3]);
}