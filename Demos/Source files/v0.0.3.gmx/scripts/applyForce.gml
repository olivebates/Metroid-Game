///applyForce(speed, fromObj, toObj);
var bounce = argument0;
var dir = point_direction(argument1.x, argument1.y, argument2.x, argument2.y);
var lenx = lengthdir_x(bounce, dir);
var leny = lengthdir_y(bounce, dir);

hspeed += lenx;
vspeed += leny;
