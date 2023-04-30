scale = array_create(3,1);

gameoverNum = 0;

newRecord = 0;
timer = 0;

global.lives = 12*(1+global.hintMode);
global.score = 0;

// Leaderboard ids
tutorialID = ["CgkIsZiXgOcREAIQAA","CgkIsZiXgOcREAIQCw"];

currentLeaderboardPos = 0;
leaderboardIDs = [["CgkIsZiXgOcREAIQAQ","CgkIsZiXgOcREAIQAg","CgkIsZiXgOcREAIQAw","CgkIsZiXgOcREAIQBA","CgkIsZiXgOcREAIQBQ","CgkIsZiXgOcREAIQBg","CgkIsZiXgOcREAIQBw","CgkIsZiXgOcREAIQCA","CgkIsZiXgOcREAIQCQ","CgkIsZiXgOcREAIQCg"],
["CgkIsZiXgOcREAIQDA","CgkIsZiXgOcREAIQDQ","CgkIsZiXgOcREAIQDg","CgkIsZiXgOcREAIQDw","CgkIsZiXgOcREAIQEA","CgkIsZiXgOcREAIQEQ","CgkIsZiXgOcREAIQEg","CgkIsZiXgOcREAIQEw","CgkIsZiXgOcREAIQFA","CgkIsZiXgOcREAIQFQ"]];

leaderboardScores = [1000,3000,5000,10000,15000,20000,25000,30000,40000,50000];