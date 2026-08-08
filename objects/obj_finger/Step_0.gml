if keyboard_check_pressed(vk_space){
    global.go=true;
    timer=60
    if (timer <= 0)
    {
        timer = timer_set;
    }
}

if global.go=true{
    dest_x = _x+14;
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
    if instance_exists(obj_bola){
        if obj_bola.hsp=0 and obj_bola.vsp=0{
            timer--
        }
    }else{
        timer --;
    }
}else{
    if (global.go)
    {
        goBack()
    }
}

show_debug_message(timer)

x=lerp(x, dest_x, 0.2);