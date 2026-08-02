
if (mouse_check_button_pressed(mb_right) && global.dm_atual == noone)
{
    var _domino=instance_create_layer(mouse_x, mouse_y, "Dominos", obj_domino)
    _domino.canMove=true
    
    global.dm_atual = _domino;
}