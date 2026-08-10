if (global.hitstop){
    image_speed=0
    exit
}

if push{
    var domino=instance_place(x+CELL_SIZE*image_xscale, y, obj_domino)
    
    if domino && domino.state == domino.stateParado{
        domino.state=domino.stateFalling
    }
    if image_index>image_number-1{
        image_speed=0
    }else{
        image_speed=1
    }
}else if !goback{
    image_index=0
}

if goback{
    image_speed=-1
    if image_index<0.5{
        goback=false
        push=true
    }
}