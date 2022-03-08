/// @desc
enableLive;
audio_listener_position(room_width/2, room_height/2, 100);

test = audio_emitter_create();
audio_play_sound_on(test,Sound1,true,1);

audio_emitter_falloff(test,50,180,1);
audio_falloff_set_model(audio_falloff_linear_distance);