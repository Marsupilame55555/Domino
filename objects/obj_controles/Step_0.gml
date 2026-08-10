if (keyboard_check_pressed(vk_f11))
{
    window_set_fullscreen(!window_get_fullscreen());
}

if ((global.dm_atual==noone && !global.go) && objectIndex != array_length(objects)-1){
    if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, collisionList)) && quantidadeObjetos[objectIndex]>0
    {
        if objects[objectIndex] == obj_domino or objects[objectIndex] == obj_canhao{
            var _layer="Dominos"
        }else{
            var _layer="Caminhos"
        }
        var _instance=instance_create_layer(mouse_x, mouse_y, _layer, objects[objectIndex])
        
        quantidadeObjetos[objectIndex]--
        obj_hud.xscale=1.5
        obj_hud.yscale=1.5
        
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
        objectIndex++
    }
    
    if mouse_wheel_down(){
        objectIndex--
    }
    
    if objectIndex < 0{
        objectIndex=array_length(objects)-1
    }else if objectIndex>array_length(objects)-1{
        objectIndex=0
    }
}


if (objectIndex == array_length(objects)-1)
{
    global.lixo = true;
    if (mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, collisionList)) && !global.go
    {
        var _ob = instance_position(mouse_x, mouse_y, objects);
        
        if (_ob)
        {
            var index=array_get_index(objects, _ob.object_index)
            quantidadeObjetos[index]++
            
            instance_destroy(_ob)
            global.dm_atual=noone
        }
    }
}else
{
    global.lixo = false;
}

if (global.obj_livres.caminho)
{
    if (!array_contains(objects, obj_caminho))
    array_push(objects, obj_caminho);
}else
{
    if (array_contains(objects, obj_caminho))
    {
        var index=array_get_index(objects, obj_caminho)
        array_delete(objects, index, 1)
    }
        
}

if (global.obj_livres.canhao)
{
    if (!array_contains(objects, obj_canhao))
    array_push(objects, obj_canhao);
}else
{
    if (array_contains(objects, obj_canhao))
    {
        var index=array_get_index(objects, obj_canhao)
        array_delete(objects, index, 1)
    }
}

if !array_contains(objects, obj_lixo){array_push(objects, obj_lixo)}

objectEquiped=objects[objectIndex]
