drawDir = 0;
dir = 0;

shootPercent = 1;
cannonLength = 10;
bulletLength = 11;

shake = array_create(4,0);
generalShake = 0;

cannonMove = 0;

deathSpd = 45;

penalty = 0;

shoot = false;

startScale = 0;
curve = animcurve_get_channel(PlayerStartCurve,0);

secret = [90,90,270,270,180,0,180,0];
currentSecret = 0;