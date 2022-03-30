dead = false;
deadPercent = 0;
hit = false;
circlePercent = 0;
speed = -3-global.hardMode;
timePoints = floor(((global.time+oBeatController.aheadTime)*2) % oBeatController.numberOfBeats);

appear = !global.start;