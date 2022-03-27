song = noone;

numberOfBeats = 8;
beats = array_create(numberOfBeats,0);
lastTime = 100;
aheadLastTime = 100;
bpm = 130;
if(global.hardMode) bpm = 170;

aheadTime = 0.73;

barNumber = 0;

mode = 0;

dirSounds = [snRight,snUp,snLeft,snDown];

extraBeat = ds_list_create();
ds_list_add(extraBeat,-1,-1,-1,-1);