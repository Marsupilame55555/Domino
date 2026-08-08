if (instance_exists(obj_domino))
{
    var domino = instance_place(x,y,obj_domino);
    
    var domino_left = collision_rectangle(x - sprite_width/2, y - sprite_height/2, x, y + sprite_height/2, domino, 0, 1 );
    var domino_right = collision_rectangle(x + sprite_width/2, y - sprite_height/2, x, y + sprite_height/2, domino, 0, 1 );
    
    if domino && domino.state == domino.stateFalled{
        if domino_right{
            if (image_index != MODE.off)
            {
                image_index = MODE.off;
            }
        }
        if domino_left{
            if (image_index != MODE.on)
            {
                image_index = MODE.on;
            }
            actionOn()
        }
    }
}

if image_index==MODE.off{
    actionOff()
}