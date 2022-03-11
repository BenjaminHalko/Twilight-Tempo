function Approach(a, b, amount)
{
	if (a < b)
	{
	    a += amount;
	    if (a > b)
	        return b;
	}
	else
	{
	    a -= amount;
	    if (a < b)
	        return b;
	}
	return a;
}

function ApproachCircle(Value,Target,Spd)
{
	return Approach(Value,Value+angle_difference(Target,Value),Spd);
}

function ApproachFade(Value,Target,MaxSpd,Ease)
{
	Value += median(-MaxSpd,MaxSpd,(1-Ease)*(Target-Value));
	return Value;
}

function ApproachCircleEase(Value,Target,MaxSpd,Ease)
{
	Value += median(-MaxSpd,MaxSpd,(1-Ease)*angle_difference(Target,Value));
	return Value
}

function ValuePercent(_x, _a, _b) {
	
	return (_x - _a) / (_b - _a)
}

function Wave(_from, _to, _duration, _offset)
{
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
 
	a4 = (_to - _from) * 0.5;
	return _from + a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * a4;
}

function Wrap(argument0, argument1, argument2) {
	// Returns the value wrapped, values over or under will be wrapped around
 
	if (argument0 mod 1 == 0)
	{
	    while (argument0 > argument2 || argument0 < argument1)
	    {
	        if (argument0 > argument2)
	            argument0 += argument1 - argument2 - 1;
	        else if (argument0 < argument1)
	            argument0 += argument2 - argument1 + 1;
	    }
	    return(argument0);
	}
	else
	{
	    var vOld = argument0 + 1;
	    while (argument0 != vOld)
	    {
	        vOld = argument0;
	        if (argument0 < argument1)
	            argument0 = argument2 - (argument1 - argument0);
	        else if (argument0 > argument2)
	            argument0 = argument1 + (argument0 - argument2);
	    }
	    return(argument0);
	}

}

function SetAlarm(_alarm,_time)
{
	if(alarm[_alarm] <= 0) alarm[_alarm] = _time;
}

function DrawSetText(_font,_colour,_halign,_valign)
{
	draw_set_font(_font);
	draw_set_colour(_colour);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}

function DropShadowText(_x,_y,_text,_borderSize,_colour,_borderColour)
{
	draw_set_colour(_borderColour);
	draw_text(_x-_borderSize,_y-_borderSize,_text);
	draw_text(_x-_borderSize,_y+_borderSize,_text);
	draw_text(_x+_borderSize,_y-_borderSize,_text);
	draw_text(_x+_borderSize,_y+_borderSize,_text);
	draw_set_colour(_colour);
	draw_text(_x,_y,_text);
}

function drawCircle(_x,_y,_radius,_alpha) {
	for(var i = 0; i < 6; i++) {
		draw_set_alpha((0.8-i*0.1)*_alpha);
		draw_circle(_x-1,_y-1,_radius+i*3,false);
	}
	draw_set_alpha(_alpha);
	draw_circle(_x-1,_y-1,16,false);
	if(_alpha != 1) draw_set_alpha(1);
}