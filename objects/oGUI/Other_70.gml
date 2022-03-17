/// @desc
if(!ds_map_exists(async_load,"data")) exit;
if(!is_struct(async_load[? "data"])) exit;
if(!variable_struct_exists(async_load[? "data"],"scores")) exit; 
var _scores = async_load[? "data"].scores;
if(array_length(_scores) != 0) global.hiScore = max(global.hiScore,_scores[0].score);