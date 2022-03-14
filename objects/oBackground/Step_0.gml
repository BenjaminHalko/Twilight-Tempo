/// @desc
enableLive;

if(global.start && !instance_exists(oEnemy) && audio_is_paused(oBeatController.song)) mode = 1;

if(global.index != 8*mode && alarm[0] <= 0) alarm[0] = 10+global.start*20;