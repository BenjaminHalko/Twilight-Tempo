started = false;
numberOfBeats = 8;
beats = array_create(numberOfBeats,0);
lastTime = 100;
aheadLastTime = 100;
if(global.hardMode) global.bpm = 170;

aheadTime = 0.73;

barNumber = 8*global.demo;

mode = 0;

dirSounds = [snRight,snUp,snLeft,snDown];

extraBeat = ds_list_create();
ds_list_add(extraBeat,-1,-1,-1,-1);

if(!global.demo) global.song = noone;
else {
	lastTime = floor(global.time % numberOfBeats*2)
	mode = irandom(9);
}