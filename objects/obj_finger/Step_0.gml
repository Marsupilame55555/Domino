if keyboard_check_pressed(vk_space){
    go=true
}

if go=true{
    x=lerp(x, _x+14, 0.2)
}

var domino=instance_place(x,y,obj_domino)
if domino and domino.state=domino.stateNormal{
    with (domino) {
    	state=stateFalling
    }
}