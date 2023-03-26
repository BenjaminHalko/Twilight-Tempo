scale = array_create(3,1);

gameoverNum = 0;

newRecord = 0;
timer = 0;

global.lives = 12*(1+global.hintMode);
global.score = 0;

// Leaderboard ids
tutorialID = ["CgkI8N_53PcREAIQAw","CgkI8N_53PcREAIQBA"];

currentLeaderboardPos = 0;
leaderboardIDs = [["CgkI8N_53PcREAIQBQ","CgkI8N_53PcREAIQBg","CgkI8N_53PcREAIQBw","CgkI8N_53PcREAIQCA","CgkI8N_53PcREAIQCQ","CgkI8N_53PcREAIQCg","CgkI8N_53PcREAIQCw","CgkI8N_53PcREAIQDA","CgkI8N_53PcREAIQDg","CgkI8N_53PcREAIQEA"],
["CgkI8N_53PcREAIQEg","CgkI8N_53PcREAIQEw","CgkI8N_53PcREAIQFA","CgkI8N_53PcREAIQFQ","CgkI8N_53PcREAIQFg","CgkI8N_53PcREAIQFw","CgkI8N_53PcREAIQGA","CgkI8N_53PcREAIQGQ","CgkI8N_53PcREAIQGw","CgkI8N_53PcREAIQHQ"]];

leaderboardScores = [1000,3000,5000,10000,15000,20000,25000,30000,40000,50000];

global.hiScore[0] = 3795;