/// @desc
enableLive;
audio_listener_position(0, 0, 0);
audio_listener_orientation(0,1,0,0,0,-1);

test = audio_emitter_create();
audio_play_sound_on(test,Sound1,true,1);

audio_emitter_falloff(test,0.5,1,1);
audio_falloff_set_model(audio_falloff_linear_distance);