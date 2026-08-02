canMove=false
collisionList=[obj_domino, obj_finger, obj_pointB, obj_caminho_reto];
sprites=choose(spr_dominoFall_1, spr_dominoFall_2, spr_dominoFall_3, spr_dominoFall_4)
angle=0
angleGoal=0



stateParado=function(){
    sprite_index=spr_domino;
    if position_meeting(mouse_x, mouse_y, id){
        if  (mouse_check_button_pressed(mb_left)){
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
        
        angle=irandom_range(-5, 5)
        audio_sound_pitch_range(snd_domino, 0.15)
        
        if image_angle=0{
            if dominoAngle=180 || dominoAngle=135 || dominoAngle=225 || dominoAngle=-180 || dominoAngle=-225 || dominoAngle=-135{
                image_angle=180
            }
        }else if image_angle=45 || image_angle=-315{
            if dominoAngle=180 || dominoAngle=270 || dominoAngle=225 || dominoAngle=-180 || dominoAngle=-90 || dominoAngle=-135{
                image_angle=225
            }
        }else if image_angle=90  || image_angle=-270{
            if dominoAngle=270 || dominoAngle=315 || dominoAngle=225 || dominoAngle=-90 || dominoAngle=-45 || dominoAngle=-135{
                image_angle=270
            }
        }else if image_angle=135 || image_angle=-225{
            if dominoAngle=270 || dominoAngle=315 || dominoAngle=0 || dominoAngle=-90 || dominoAngle=-45{
                image_angle=315
            }
        }else if image_angle=180 || image_angle=-180{
            if dominoAngle=315 || dominoAngle=45 || dominoAngle=0 || dominoAngle=-315 || domino=-45{
                image_angle=0
            }
        }else if image_angle=225 || image_angle=-135{
            if dominoAngle=90 || dominoAngle=45 || dominoAngle=0 || dominoAngle=-270 || dominoAngle=-315{
                image_angle=45
            }
        }else if image_angle=270 || image_angle=-90{
            if dominoAngle=135 || dominoAngle=90 || dominoAngle=45 || dominoAngle=-225 || dominoAngle=-315 || dominoAngle=-270{
                image_angle=90
            }
        }else if image_angle=315 || image_angle=-45{
            if dominoAngle=180 || dominoAngle=90 || dominoAngle=135 || dominoAngle=-180 || dominoAngle=-270 || dominoAngle=-225{
                image_angle=135
            }
        }
        
        state=stateFalling
    }
    
    if image_angle>=360 || image_angle<=-360{
        image_angle=0
    }
    
    image_angle += sin(degtorad(angleGoal - image_angle)) * 15;
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
        angleGoal-=45
    } else if (mouse_wheel_up())
    {
        angleGoal+=45
    }
    
    if image_angle>=360 || image_angle<=-360{
        image_angle=0
    }
    
    image_angle += sin(degtorad(angleGoal - image_angle)) * 15;
}

stateFalling=function(){
    sprite_index=sprites
    screenShake(15)
    if (global.dm_atual != noone)
    {
        global.dm_atual = noone;
    }
    if image_index>image_number-1{
        state=stateFalled
    }
    
}

stateFalled=function(){
    image_speed=0
}

state=stateParado;