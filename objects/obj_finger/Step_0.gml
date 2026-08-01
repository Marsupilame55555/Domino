if keyboard_check_pressed(vk_space){
    go=true;
    if (timer <= 0)
    {
        timer = timer_set;
    }
}

if go=true{
    dest_x = _x+14;
}else 
{
    dest_x = xstart;
}


var domino=instance_place(x,y,obj_domino)

if ((domino and domino.state=domino.stateParado) && go){
    with (domino) {
    	state=stateFalling;
    }
}
if (timer > 0)
{
    timer --;
}

if (timer <= 0)
{
    if (go)
    {
        go = false; 
    }
}


x=lerp(x, dest_x, 0.2);