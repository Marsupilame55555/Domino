if (keyboard_check_pressed(vk_f11))
{
    window_set_fullscreen(!window_get_fullscreen());
}



if ((global.dm_atual==noone && !global.go) && objectEquiped != array_length(objects)-1){
    if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, collisionList))
    {
        var _instance=instance_create_layer(mouse_x, mouse_y, "Dominos", objects[objectEquiped])
        
        var nx = ((mouse_x div CELL_SIZE) * CELL_SIZE) ;
        var ny = ((mouse_y div CELL_SIZE) * CELL_SIZE);
        if (!place_meeting(nx, ny, _instance.collisionList))
        {
            _instance.x = nx;
            _instance.y = ny;
        }
        
        _instance.canMove=true
        
        global.dm_atual = _instance;
    }
}

if (global.dm_atual==noone && !global.go)
{
    if mouse_wheel_up(){
        objectEquiped++
    }
    
    if mouse_wheel_down(){
        objectEquiped--
    }
    
    if objectEquiped < 0{
        objectEquiped=array_length(objects)-1
    }else if objectEquiped>array_length(objects)-1{
        objectEquiped=0
    }
}


if (objectEquiped == array_length(objects)-1)
{
    global.lixo = true;
    if (mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, collisionList))
    {
        var _ob = instance_position(mouse_x, mouse_y, objects);
        
        if (_ob)
        {
            instance_destroy(_ob)
        }
    }
}else
{
    global.lixo = false;
}

