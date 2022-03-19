song = noone;

numberOfBeats = 8+8*global.hardMode;
beats = array_create(numberOfBeats,0);
lastTime = 100;
aheadLastTime = 100;
bpm = 130;

barNumber = 0;

startTime = 0;

mode = 0;

dirSounds = [snRight,snUp,snLeft,snDown];

extraBeat = ds_list_create();
ds_list_add(extraBeat,-1,-1,-1,-1);

if(global.hardMode) ds_list_add(extraBeat,-1,-1,-1,-1);