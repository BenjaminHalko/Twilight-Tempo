scale = array_create(3,1);

gameoverNum = 0;
gameoverChoice = 0;

global.lives = 12*(1+global.hintMode);
global.score = 0;

newHighscore = -1;
selected = 0;

name = [65,65,65];

if(global.demo) global.score = choose(irandom(3000),irandom_range(5000,10000),irandom(40000));