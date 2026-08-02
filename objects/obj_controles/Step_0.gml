if (keyboard_check_pressed(vk_f11))
{
    window_set_fullscreen(!window_get_fullscreen());
}

if (mouse_check_button_pressed(mb_right) && global.dm_atual == noone)
{
    var _domino=instance_create_layer(mouse_x, mouse_y, "Dominos", obj_domino)
    
    var nx = ((mouse_x div CELL_SIZE) * CELL_SIZE) ;
    var ny = ((mouse_y div CELL_SIZE) * CELL_SIZE);
    if (!place_meeting(nx, ny, _domino.collisionList))
    {
        _domino.x = nx;
        _domino.y = ny;
    }
    
    _domino.canMove=true
    
    global.dm_atual = _domino;
}