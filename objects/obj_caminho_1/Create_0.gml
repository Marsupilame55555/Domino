canMove=false;
collisionList = [obj_domino, obj_finger, obj_buttonPar, obj_door, obj_caminho]
dir_pointer=0
cellsizeCaminho=24
way=""


checkWhat=function(){
    var colLeft=place_meeting(x-1, y, obj_caminho) or place_meeting(x-1, y, obj_caminho_1)
    var colRight=place_meeting(x+1, y, obj_caminho) or place_meeting(x+1, y, obj_caminho_1)
    var colUp=place_meeting(x, y-1, obj_caminho) or place_meeting(x, y-1, obj_caminho_1)
    var colDown=place_meeting(x, y+1, obj_caminho) or place_meeting(x, y+1, obj_caminho_1)
    
    image_angle=0
    
    if (colRight or colLeft) and !colDown and !colUp{
        way="horizontal"
        image_index=2
    } else if !colLeft and !colRight and (colDown or colUp){
        way="vertical"
        image_index=2
        image_angle=90
    } else if colLeft and !colRight and colDown and !colUp{
        way="leftDown"
        image_index=3
        image_yscale=-1
        image_xscale=1
    }else if colLeft and !colRight and !colDown and colUp{
        way="leftUp"
        image_index=3
        image_xscale=1
        image_yscale=1
    }else if !colLeft and colRight and colDown and !colUp{
        way="rightDown"
        image_index=3
        image_xscale=-1
        image_yscale=-1
    }else if !colLeft and colRight and !colDown and colUp{
        way="rightUp"
        image_index=3
        image_xscale=-1
        image_yscale=1
    }
}

stateParado = function()
{
    checkWhat()
    if (position_meeting(mouse_x, mouse_y, id))
    {
        if (mouse_check_button_pressed(mb_left)  && !global.lixo && global.go==false)
        {
            global.dm_atual = id;
            state = stateMoving;
        }
    }
    
    if canMove{
        state = stateMoving;
    }
}

stateMoving=function(){
    
    var nx = ((mouse_x div cellsizeCaminho) * cellsizeCaminho)+12 ;
    var ny = ((mouse_y div cellsizeCaminho) * cellsizeCaminho)+12;
    if (!place_meeting(nx, ny, collisionList))
    {
        x = nx;
        y = ny;
    }
    
    if (global.go)
    {
        global.dm_atual = noone;
        obj_controles.quantidadeObjetos[0]++
        instance_destroy();
    }
    
    if  mouse_check_button_pressed(mb_left){
        canMove=false;
        global.dm_atual = noone;
        state = stateParado;
    }
}



state=stateParado