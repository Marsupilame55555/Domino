timer = 0;





#region metodos





conta_hitstop = function()
{

    if (!global.hitstop) return;
    
    timer --;
    
    
    with (all) {
        image_speed = 0;
    }
    
    if (timer <= 0)
    {
        global.hitstop = false;
        
        //
        //with (all) {
            //image_speed = 1;
        //}
        
    }

}

#endregion