canMove=false
collisionList=[obj_domino, obj_finger, obj_block, obj_door, obj_buttonPar]
sprites=choose(spr_dominoFall_1, spr_dominoFall_2, spr_dominoFall_3, spr_dominoFall_4, spr_dominoFall_5, spr_dominoFall_6, spr_dominoFall_7)
angle=0
angleGoal=0

stateText=""



stateParado=function(){
    stateText="Parado"
    
    sprite_index=spr_domino;
    if position_meeting(mouse_x, mouse_y, id){
        if  mouse_check_button_pressed(mb_left){
            canMove=true
            global.dm_atual = id;
            state = stateMoving;
        }
    }
    
    if canMove{
        state = stateMoving;
    }
    
    var domino=instance_place(x,y,obj_domino)
    if domino and (domino.state=domino.stateFalled || domino.state=domino.stateFalling){
        var dominoAngle=domino.image_angle
        depth=domino.depth+1
        screenShake(25)
        obj_finger.timer=80;
        
        angle=irandom_range(-4, 4)
        audio_sound_pitch_range(snd_domino, 0.15)
        
        if dominoAngle==image_angle-180 || dominoAngle == image_angle-135 || dominoAngle==image_angle-225{
            image_angle-=180
        }
        if dominoAngle==image_angle+180 || dominoAngle == image_angle+135 || dominoAngle==image_angle+225{
            image_angle+=180
        }
        
        state=stateFalling
    }
    
    if image_angle>=360 || image_angle <=-360{
        image_angle=0
    }
    
    image_angle += sin(degtorad(angleGoal - image_angle)) * 30;
}

stateMoving=function(){
    stateText="Moving"
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
        instance_destroy();
    }
    
    if (mouse_wheel_down())
    {
        angleGoal-=45
    } else if (mouse_wheel_up())
    {
        angleGoal+=45
    }
    
    if image_angle>=360 || image_angle <=-360{
        image_angle=0
    }
    
    image_angle += sin(degtorad(angleGoal - image_angle)) * 30;
}

stateFalling=function(){
    stateText="Caindo"
    
    image_speed=1
    
    sprite_index=sprites
    
    if (global.dm_atual != noone)
    {
        global.dm_atual = noone;
    }
    if image_index>image_number-1{
        state=stateFalled
    }
    
}

stateGoingBack=function(){
    image_speed=-1
    angle=0
    
    if image_index<0.5{
        state=stateParado
    }
}

stateFalled=function(){
    stateText="Caido"
    image_speed=0
}

state=stateParado;