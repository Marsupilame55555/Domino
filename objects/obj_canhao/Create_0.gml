actvate = false;

canMove=false
collisionList=[obj_domino, obj_finger, obj_buttonEnd, obj_block, obj_door, obj_buttonDoor, obj_buttonPiston]


dir = 0;

actvate = false;
criate = false;

xscale = 1;
yscale = 1;





stateParado=function(){
    if position_meeting(mouse_x, mouse_y, id){
        if  (mouse_check_button_pressed(mb_left) && !global.lixo && global.go==false){
            canMove=true
            global.dm_atual = id;
            state = stateMoving;
        }
    }
    
    if canMove{
        state = stateMoving;
    }
    
    if (!actvate)
    {
        image_index = 0;
        image_speed = 0;
    }
    
    if (actvate && !criate)
    {
        image_speed = 1;
    }
    
    
    if (image_speed > 0)
    {
        if (image_index >= image_number-1 && !criate)
        {
            var _offx = x + lengthdir_x(25, image_angle);
            var _offy = y + lengthdir_y(25, image_angle);
            
            var _d = instance_create_layer(_offx, _offy, layer, obj_domino_canhao);
            
            var _spd = _d.spd;
            _d.velh = lengthdir_x(_spd, image_angle);
            _d.velv = lengthdir_y(_spd, image_angle);
            _d.dir = image_angle;
            image_speed = 0;
            
            xscale = 1.4;
            yscale = .8;
            
            criate = true;
            
            obj_finger.timer=100
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
    
    if (global.go)
    {
        global.dm_atual = noone;
        obj_controles.quantidadeObjetos[2]++
        instance_destroy();
    }
    
    if (mouse_wheel_down())
    {
        dir -= 10;
    } else if (mouse_wheel_up())
    {
        dir += 10;
    }
    
    if image_angle>=360 || image_angle <=-360{
        image_angle=0
    }
    
    image_angle += sin(degtorad(dir - image_angle)) * 30;
}

state = stateParado;