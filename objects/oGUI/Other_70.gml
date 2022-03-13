/// @desc
var _scores = async_load[? "data"].scores;
if(array_length(_scores) != 0) global.hiScore = max(global.hiScore,_scores[0].score);