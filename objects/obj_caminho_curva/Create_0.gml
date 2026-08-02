
canMove=false;
collisionList = [obj_domino, obj_finger, obj_pointB, obj_caminho_reto]

if (!instance_exists(obj_bola))
{
    var b = instance_create_depth(x, y, depth-1, obj_bola);
    b.meu_estrada = id;
}


stateParado = function()
{
    if (position_meeting(mouse_x, mouse_y, id))
    {
        if (mouse_check_button_pressed(mb_left))
        {
            global.dm_atual = id;
            state = stateMoving;
        }
    }
}



stateMoving=function(){
    
    var nx = ((mouse_x div CELL_SIZE) * CELL_SIZE) ;
    var ny = ((mouse_y div CELL_SIZE) * CELL_SIZE);
    if (!place_meeting(nx, ny, collisionList))
    {
        x = nx;
        y = ny;
    }
    if  mouse_check_button_pressed(mb_left){
        canMove=false;
        global.dm_atual = noone;
        state = stateParado;
    }
    
    if (mouse_wheel_down())
    {
        image_angle-=90
    }
    if (mouse_wheel_up())
    {
        image_angle+=90
    }
    
    
    if (image_angle >= 360 || image_angle <= -360)
    {
        image_angle = 0;
    }
}






































state = stateParado;