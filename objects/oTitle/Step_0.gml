/// @desc

if(audio_is_playing(song)) {
	var _time = floor(audio_sound_get_track_position(song)/60*bpm);
	if(_time != lastTime) bounce = 1.2;
	
	lastTime = _time;
}

bounce = ApproachFade(bounce,1,0.05,0.6)

if(show and selected == 0) {
	//Buttons
	if mouse_check_button_pressed(mb_left) {
		 if menuType == Menu.Main {
			 if normal.clicked() {
				menuType = Menu.Normal;
				global.hardMode = false;
				audio_play_sound(snBlip,1,false);
				pb.updateText("HISCORE: "+string_replace(string_format(global.hiScore[0],4,0)," ","0"));
				event_user(0);
			} else if hard.clicked() {
				menuType = Menu.Hard;
				global.hardMode = true;
				audio_play_sound(snBlip,1,false);
				pb.updateText("HISCORE: "+string_replace(string_format(global.hiScore[1],4,0)," ","0"));
				event_user(0);
			} else if achievements.clicked() {
				GooglePlayServices_Achievements_Show();
				audio_play_sound(snBlip,1,false);
			}
		} else if back.clicked() {
			menuType = Menu.Main;
			audio_play_sound(snBlip,1,false);
		} else if tutorial.clicked() {
			tutorial.index = 1-tutorial.index;
			global.start = !tutorial.index;
			audio_play_sound(snBlip,1,false);
			ini_open("save.ini");
			ini_write_real("Mode","Tutorial",global.start);
			ini_close();
		} else if leaderboard.clicked() {
			GooglePlayServices_Leaderboard_Show(global.hardMode ? NormalLeaderboard : NormalLeaderboard);
			audio_play_sound(snBlip,1,false);
		} else if start.clicked() {
			selected = 1;
			alarm[0] = 5;
			audio_stop_sound(song);
			audio_play_sound(snSelect,1,false);
			global.hintMode = false;
		} else if practice.clicked() {
			selected = 1;
			alarm[0] = 5;
			audio_stop_sound(song);
			audio_play_sound(snSelect,1,false);
			global.hintMode = true;
		}
	}
}

if keyboard_check_pressed(vk_backspace) {
	if menuType == Menu.Main game_end();
	else menuType = Menu.Main;
}

logoY = ApproachFade(logoY,1,0.02,0.85);

if(logoY >= 1) {
	if(logoX == 0) audio_play_sound(snIntro2,1,false);
	logoX = Approach(logoX,2,0.05);
}

if(logoX >= 2 && !show) {
	show = true;
	event_user(0);
	song = audio_play_sound(mSong,1,true);
}

if(array_length(stars) < 150) array_push(stars,{
	x: random(WIDTH),
    y: random(HEIGHT),
	col: choose(c_yellow,c_fuchsia),
	alpha1: random(1),
	alpha2: random(1),
	alphaSpeed: random_range(1,5),
	alphaOffset: random(1),
	far: random(1)
});