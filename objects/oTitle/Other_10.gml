/// @desc Window Resize

if oGlobalController.width > oGlobalController.height {
	normal.iconOverText = true;
	normal.textSize = 1;
	normal.updateText("NORMAL");
	normal.width = normal.originalWidth;
	normal.draw();
	
	hard.iconOverText = true;
	hard.textSize = 1;
	hard.updateText("HARD");
	hard.width = hard.originalWidth;
	hard.draw();
	
	pb.height = pb.originalHeight;
	pb.draw();
	
	start.height = start.originalHeight;
	start.draw();
	
	// Main
	normal.x = room_width/2-normal.borderWidthHalf-10;
	normal.y = GUIY+HEIGHT/2+38;
	hard.x = room_width/2+hard.borderWidthHalf+10;
	hard.y = GUIY+HEIGHT/2+38;
	
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
	
	achievements.x = GUIX+WIDTH-17;
	achievements.y = GUIY+HEIGHT-17;
	achievements.updateText("");
	
	back.x = GUIX+WIDTH-17;
	back.y = GUIY+HEIGHT-17;
	back.updateText("");
	back.coloredBorder = c_white; 
} else {
	start.height = 30;
	start.draw();
	
	pb.height = -1;
	pb.draw();
	
	practice.height = 10;
	practice.draw();
	
	normal.x = room_width/2;
	normal.y = GUIY+HEIGHT/2-30+16;
	
	hard.x = room_width/2;
	hard.y = GUIY+HEIGHT/2+30+16;
	
	start.x = room_width/2;
	practice.x = start.x;
	tutorial.x = start.x;
	pb.x = start.x;
	
	start.y = GUIY+HEIGHT/2+34-50;
	practice.y = start.y+start.borderHeightHalf+practice.borderHeightHalf+8;
	
	
	normal.iconOverText = false;
	normal.textSize = 2;
	normal.updateText("NORMAL");
	normal.width = WIDTH-32;
	
	hard.iconOverText = false;
	hard.textSize = 2;
	hard.updateText("HARD");
	hard.width = WIDTH-32;
	
	achievements.x = room_width/2;
	achievements.y = GUIY+HEIGHT-48;
	achievements.updateText("ACHIEVEMENTS");
	
	back.x = room_width/2;
	back.y = GUIY+HEIGHT-48;
	back.updateText("BACK TO MAIN MENU");
	back.coloredBorder = -1;
	
	start.width = WIDTH-32;
}

back.x = GUIX+WIDTH-17;
back.y = GUIY+HEIGHT-17;
back.updateText("");
back.coloredBorder = c_white;

