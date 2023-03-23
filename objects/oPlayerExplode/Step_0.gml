/// @desc

if global.pause exit;

for(var i = 0; i < array_length(explodeArray); i++) {
	explodeArray[i][2] += lengthdir_x(explodeArray[i][4],explodeArray[i][5]);
	explodeArray[i][3] += lengthdir_y(explodeArray[i][4],explodeArray[i][5]);
	explodeArray[i][6]++;
	explodeArray[i][4] = ApproachFade(explodeArray[i][4],0,0.01,0.9);
	if(explodeArray[i][6] >= explodeArray[i][7]) {
		array_delete(explodeArray,i,1);
		i--;
	}
}

if(array_length(explodeArray) == 0) instance_destroy();