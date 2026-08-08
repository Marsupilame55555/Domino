event_inherited()
actionOn=function(){
    tween(friend, "x", friend.goal, tween_animation.elastic, 80)
}
actionOff=function(){
    tween(friend, "x", friend.xstart, tween_animation.elastic, 80)
}