event_inherited()

actionOff=function(){
    
}

actionOn=function(){
    layer_sequence_create("Transition", room_width/2, room_height/2, seq_transitionIn)
    obj_hud.canDraw=false
}