if (instance_exists(obj_domino))
{
    var domino = instance_place(x,y,obj_domino);
    
    if domino && domino.state == domino.stateFalled{
        image_index=MODE.on
        actionOn()
    }
}

if image_index==MODE.off{
    actionOff()
}