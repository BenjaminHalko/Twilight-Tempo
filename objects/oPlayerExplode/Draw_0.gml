/// @desc

for(var i = 0; i < array_length(explodeArray); i++) {
	if(colorList[| explodeArray[i][6]] == 0)  {
		array_delete(explodeArray,i,1);
		i--;
		continue;
	}
	draw_point_color(explodeArray[i][0],explodeArray[i][1],colorList[| explodeArray[i][6]]);
	explodeArray[i][0] += lengthdir_x(explodeArray[i][2],explodeArray[i][3]);
	explodeArray[i][1] += lengthdir_y(explodeArray[i][2],explodeArray[i][3]);
	explodeArray[i][4]++;
	explodeArray[i][2] = ApproachFade(explodeArray[i][2],0,0.01,0.9);
	if(explodeArray[i][4] >= explodeArray[i][5]) {
		array_delete(explodeArray,i,1);
		i--;
	}
}

if(array_length(explodeArray) == 0) instance_destroy();