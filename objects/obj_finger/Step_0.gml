if (global.hitstop) exit

if keyboard_check_pressed(vk_space){
    global.go=true;
    timer=60
    if (timer <= 0)
    {
        timer = timer_set;
    }
}

if global.go=true{
    dest_x = xstart+14;
}else 
{
    dest_x = xstart;
}


var domino=instance_place(x,y,obj_domino)

if ((domino and domino.state=domino.stateParado) && global.go){
    with (domino) {
        var dominoAngle=domino.image_angle
    	state=stateFalling;
        if dominoAngle == image_angle+180 || dominoAngle == image_angle+135 || dominoAngle == image_angle+225{
            domino.image_angle+=180
        } else if dominoAngle == image_angle-180 || dominoAngle == image_angle-135 || dominoAngle == image_angle-225{
            domino.image_angle-=180
        }
    }
}

if (timer > 0)
{
    if instance_exists(obj_bola) && !instance_exists(obj_bola_1){
        if (obj_bola.state==obj_bola.stateParado or obj_bola.state==obj_bola.stateBateu){
            timer--
        }
        
    }
    
    var _total = instance_number(obj_bola_1);
    var countDown=true
    with obj_bola_1{
        if state==stateGo{
            countDown=false
        }
    }
    
    if instance_exists(obj_bola_1) && !instance_exists(obj_bola) && countDown=true{
        if (obj_bola_1.state==obj_bola_1.stateParado or obj_bola_1.state==obj_bola_1.stateBateu){
            timer--
        }
    }
    if !instance_exists(obj_bola_1) && !instance_exists(obj_bola){
        timer --
    }
    
    if instance_exists(obj_bola) && instance_exists(obj_bola_1){
        if (obj_bola.state==obj_bola.stateParado or obj_bola.state==obj_bola.stateBateu) and (obj_bola_1.state==obj_bola_1.stateParado or obj_bola_1.state==obj_bola_1.stateBateu){
            timer--
        }
    }
}else{
    if (global.go)
    {
        goBack()
    }
}

show_debug_message(timer)

x=lerp(x, dest_x, 0.2);