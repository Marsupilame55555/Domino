
dest_x = 0;

timer_set = 60;
timer = 0;

back=true

goBack=function(){
    global.go = false; 
    with obj_domino{
        state=stateGoingBack
    }
    
    with obj_buttonPar{
        image_index = MODE.off
    }
    
    with obj_buttonPressPar{
        image_index = MODE.off
    }
    
    with obj_bola{
        state=stateParado
    }
    
    with obj_bola_1{
        state=stateParado
    }
}