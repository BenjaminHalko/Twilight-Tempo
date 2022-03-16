song = noone;

numberOfBeats = 8+8*global.hardMode;
beats = array_create(numberOfBeats,0);
lastTime = 100;
aheadLastTime = 100;
bpm = 130;

barNumber = 0;

extraBeat = ds_list_create();
ds_list_add(extraBeat,2,4,6,8);
if(global.hardMode) ds_list_add(extraBeat,10,12,14,16);