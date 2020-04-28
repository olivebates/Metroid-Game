if (!place_free(x + hspeed, y))
{
    move_contact_solid(direction, speed);
    hspeed = 0;
}
if (!place_free(x, y + vspeed))
{
        move_contact_solid(direction, speed);
        vspeed = 0;
}
if (!place_free(x + hspeed, y) && !place_free(x, y + vspeed))
{
    move_contact_solid(direction, speed);
    vspeed = 0;
    hspeed = 0;
}
