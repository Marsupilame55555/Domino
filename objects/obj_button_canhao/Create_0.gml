event_inherited()

actionOff=function(){
    if friend!=noone{
        friend.actvate = false;
        friend.criate = false;
    }else{
        if instance_exists(obj_canhao){
            friend=obj_canhao
        }
    }
}

actionOn=function(){
    if friend!=noone{
        friend.actvate = true;
    }
}