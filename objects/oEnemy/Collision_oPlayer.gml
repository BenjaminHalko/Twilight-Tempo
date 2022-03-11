enableLive;

if(hit or global.alive != 1) exit;
oPlayer.shake[direction div 90] = 2;
oPlayer.generalShake = 2;
hit = true;
global.lives--;
oGUI.scale[global.lives div 4] = 1.4;