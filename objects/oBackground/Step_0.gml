/// @desc
if(global.start && !instance_exists(oEnemy) && oBeatController.barNumber == 9) mode = 1;

if(index != 8*mode && alarm[0] <= 0) alarm[0] = 30;