var domino=instance_place(x,y,obj_domino)

if domino and domino.state=domino.stateFalled{
    room_goto_next()
}