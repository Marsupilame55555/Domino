


if (instance_exists(obj_domino))
{
    domino = obj_domino;
    
    var domino_left = collision_rectangle(x - sprite_width/2, y - sprite_height/2, x, y + sprite_height/2, obj_domino, 0, 1 );
    var domino_right = collision_rectangle(x + sprite_width/2, y - sprite_height/2, x, y + sprite_height/2, obj_domino, 0, 1 );
    
    if domino_left and domino.state=domino.stateFalled{
        if (image_index != MODE.on)
        {
            image_index = MODE.on;
        }
    }
    if domino_right and domino.state=domino.stateFalled{
        if (image_index != MODE.off)
        {
            image_index = MODE.off;
        }
    }
}






