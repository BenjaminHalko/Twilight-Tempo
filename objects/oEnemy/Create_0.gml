dead = false;
deadPercent = 0;
hit = false;
circlePercent = 0;
spd = -3-global.hardMode;
timePoints = floor(((global.time+oBeatController.aheadTime)*2) % oBeatController.numberOfBeats);

appear = 0;

realX = x;
realY = y;

var _dist = point_distance(x,y,room_width/2,room_height/2)/(-spd);


x = clamp(x,GUIX,GUIX+WIDTH);
y = clamp(y,GUIY,GUIY+HEIGHT);

spd = -point_distance(x,y,room_width/2,room_height/2)/_dist;