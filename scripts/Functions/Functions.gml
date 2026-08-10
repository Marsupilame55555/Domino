function change_room_transition(){
    room_goto_next()
    layer_sequence_destroy(seq_transitionIn);
    global.transition = true;
}

function delete_transition(){
    layer_sequence_destroy(seq_transitionOut)
    global.transition = false;
    obj_hud.canDraw=true
}