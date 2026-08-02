canMove=false
collisionList=[obj_domino, obj_finger, obj_pointB]
sprites=choose(spr_dominoFall_1, spr_dominoFall_2, spr_dominoFall_3, spr_dominoFall_4)
angle=0



stateParado=function(){
    sprite_index=spr_domino;
    if position_meeting(mouse_x, mouse_y, id){
        if  mouse_check_button_pressed(mb_left){
            canMove=true
            state = stateMoving;
        }
    }
    
    if image_angle=360{
        image_angle=0
    }else if image_angle=405{
        image_angle=45
    } else if image_angle=-360{
        image_angle=0
    }else if image_angle=-405{
        image_angle=315
    }
    
    var domino=instance_place(x,y,obj_domino)
    if domino and (domino.state=domino.stateFalled or domino.state=domino.stateFalling){
        var dominoAngle=domino.image_angle
        angle=irandom_range(-5, 5)
        audio_sound_pitch_range(snd_domino, 0.15)
        
        if image_angle=0{
            if dominoAngle=180 or dominoAngle=135 or dominoAngle=225{
                image_angle=180
            }
        }else if image_angle=45 or image_angle=-315{
            if dominoAngle=180 or dominoAngle=270 or dominoAngle=225{
                image_angle=225
            }
        }else if image_angle=90  or image_angle=-270{
            if dominoAngle=270 or dominoAngle=315 or dominoAngle=225{
                image_angle=270
            }
        }else if image_angle=135 or image_angle=-225{
            if dominoAngle=270 or dominoAngle=315 or dominoAngle=0{
                image_angle=315
            }
        }else if image_angle=180 or image_angle=-180{
            if dominoAngle=315 or dominoAngle=45 or dominoAngle=0{
                image_angle=0
            }
        }else if image_angle=225 or image_angle=-135{
            if dominoAngle=90 or dominoAngle=45 or dominoAngle=0{
                image_angle=45
            }
        }else if image_angle=270 or image_angle=-90{
            if dominoAngle=135 or dominoAngle=90 or dominoAngle=45{
                image_angle=90
            }
        }else if image_angle=315 or image_angle=-45{
            if dominoAngle=180 or dominoAngle=90 or dominoAngle=135{
                image_angle=135
            }
        }
        
        state=stateFalling
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
        state = stateParado;
    }
    
    if (mouse_wheel_down())
    {
        image_angle-=45
    }
    if (mouse_wheel_up())
    {
        image_angle+=45
    }
    
    
    if image_angle=360{
        image_angle=0
    }else if image_angle=405{
        image_angle=45
    } else if image_angle=-360{
        image_angle=0
    }else if image_angle=-405{
        image_angle=315
    }
}

stateFalling=function(){
    sprite_index=sprites
    if image_index>image_number-1{
        state=stateFalled
    }
    
}

stateFalled=function(){
    image_speed=0
    
}

state=stateParado;