/// @desc Window Resize

if oGlobalController.width >= oGlobalController.height {
	normal.iconOverText = true;
	normal.textSize = 1;
	normal.updateText("NORMAL");
	normal.width = normal.originalWidth;
	normal.updatePos();
	
	hard.iconOverText = true;
	hard.textSize = 1;
	hard.updateText("HARD");
	hard.width = hard.originalWidth;
	hard.updatePos();
	
	pb.width = pb.originalWidth;
	pb.height = pb.originalHeight;
	pb.updatePos();
	
	start.width = start.originalWidth;
	start.height = start.originalHeight;
	start.updatePos();
	
	practice.width = practice.originalWidth;
	practice.height = practice.originalHeight;
	practice.updatePos();
	
	tutorial.height = tutorial.originalHeight;
	tutorial.updatePos();
	
	leaderboard.height = tutorial.originalHeight;
	leaderboard.updatePos();
	
	// Main
	normal.x = room_width/2-normal.borderWidthHalf-10;
	normal.y = GUIY+HEIGHT/2+34;
	hard.x = room_width/2+hard.borderWidthHalf+10;
	hard.y = GUIY+HEIGHT/2+34;
	
	// Not Main
	start.y = GUIY+HEIGHT/2+34-tutorial.borderHeightHalf-6;
	
	practice.y = start.y-start.borderHeightHalf+tutorial.borderHeightHalf;
	tutorial.y = practice.y + start.borderHeightHalf*2 - tutorial.borderHeightHalf -practice.borderHeightHalf;
	tutorial.width = practice.widthHalf*2;
	leaderboard.y = tutorial.y + tutorial.borderHeightHalf+leaderboard.borderHeightHalf*2-4;
	leaderboard.width = tutorial.width;
	pb.y = leaderboard.y;
	
	start.x = room_width/2-(tutorial.borderWidthHalf+10)*(1-global.hardMode*2);
	tutorial.x = start.x+(start.borderWidthHalf+tutorial.borderWidthHalf+20)*(1-global.hardMode*2);
	practice.x = tutorial.x;
	leaderboard.x = practice.x;
	pb.x = start.x;
	
	practice.updatePos();
	tutorial.updatePos();
	leaderboard.updatePos();
	
	if DISPLAYRATIO < 1.15 {
		achievements.x = room_width/2;
		achievements.y = GUIY+HEIGHT-48;
		achievements.updateText("ACHIEVEMENTS");
		achievements.updatePos();
	} else {
		achievements.x = GUIX+WIDTH-17;
		achievements.y = GUIY+HEIGHT-17;
		achievements.updateText("");
		achievements.updatePos();
	}
	
	back.x = GUIX+WIDTH-17;
	back.y = GUIY+HEIGHT-17;
	back.updateText("");
	back.coloredBorder = c_white; 
	back.updatePos();
} else {
	start.width = WIDTH-32;
	start.updatePos();
	
	pb.width = start.width-40;
	pb.updatePos();
	
	
	
	start.x = room_width/2;
	pb.x = start.x;
	practice.x = start.x;
	tutorial.x = start.x;
	leaderboard.x = start.x;
	
	start.y = GUIY+HEIGHT/2+34-62;
	
	var _space = 12;
	
	if DISPLAYRATIO > 0.70 {
		back.x = GUIX+WIDTH-17;
		back.y = GUIY+HEIGHT-17;
		back.updateText("");
		back.coloredBorder = c_white;
		back.updatePos();
	} else {
		back.x = room_width/2;
		back.y = GUIY+HEIGHT-48;
		back.updateText("BACK TO MENU");
		back.coloredBorder = -1;
		back.updatePos();
		
		start.y -= back.borderHeightHalf*2-6;
	}
	
	if DISPLAYRATIO < 0.62  {
		_space = 18;	
		start.height = 42;
		start.updatePos();
		pb.height = 14;
		pb.updatePos();
		practice.width = 150;
		practice.height = 24;
		practice.updatePos();
		tutorial.width = 150;
		tutorial.height = 24;
		tutorial.updatePos();
		leaderboard.width = 150;
		leaderboard.height = 24;
		leaderboard.updatePos();
		start.y -= 18;
	} else {
		start.height = 36;
		start.updatePos();
		pb.height = 8;
		pb.updatePos();
		practice.width = practice.originalWidth;
		practice.height = practice.originalHeight;
		practice.updatePos();
		tutorial.width = practice.widthHalf*2;
		tutorial.height = tutorial.originalHeight;
		tutorial.updatePos();
		leaderboard.width = tutorial.width;
		leaderboard.height = leaderboard.originalHeight;
		leaderboard.updatePos();
	}
	
	pb.y = start.y+start.borderHeightHalf+pb.borderHeightHalf+6;
	
	practice.y = pb.y+pb.borderHeightHalf+practice.borderHeightHalf+_space;
	tutorial.y = practice.y+practice.borderHeightHalf+tutorial.borderHeightHalf+_space/2;
	leaderboard.y = tutorial.y+tutorial.borderHeightHalf+leaderboard.borderHeightHalf+_space;

	
	//Main
	normal.iconOverText = false;
	normal.textSize = 2;
	normal.updateText("NORMAL");
	normal.width = WIDTH-24;
	normal.height = HEIGHT/7;
	normal.updatePos();
	
	hard.iconOverText = false;
	hard.textSize = 2;
	hard.updateText("HARD");
	hard.width = WIDTH-24;
	hard.height = HEIGHT/7;
	hard.updatePos();
	
	normal.x = room_width/2;
	normal.y = GUIY+HEIGHT/2-(HEIGHT/6-24)+16;
	
	hard.x = room_width/2;
	hard.y = GUIY+HEIGHT/2+(HEIGHT/6-24)+16;
	
	achievements.x = room_width/2;
	achievements.y = GUIY+HEIGHT-48;
	achievements.updateText("ACHIEVEMENTS");
	achievements.updatePos();
}