/// @desc
if(global.start && !instance_exists(oEnemy) && oBeatController.barNumber == 9-4*global.hardMode) mode = 1;

if(index != 8*mode && alarm[0] <= 0) alarm[0] = 30;