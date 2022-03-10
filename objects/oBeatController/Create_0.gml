enableLive;

song = audio_play_sound(TestSong,1,true);

numberOfBeats = 4;
global.beats = array_create(numberOfBeats,0);
lastTime = 100;
aheadLastTime = 100;