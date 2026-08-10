event_inherited()
actionOn=function(){
    if friend.horizontal{
        tween(friend, "x", friend.goal, tween_animation.elastic, 80)
    }else{
        tween(friend, "y", friend.goal, tween_animation.elastic, 80)
    }
    
}
actionOff=function(){
    if friend.horizontal{
        tween(friend, "x", friend.xstart, tween_animation.elastic, 80)
    }else{
        tween(friend, "y", friend.ystart, tween_animation.elastic, 80)
    }
}