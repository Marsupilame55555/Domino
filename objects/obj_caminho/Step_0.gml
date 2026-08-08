state()
if !instance_exists(obj_bola){
    var bola=instance_create_layer(global.firstPath.x,global.firstPath.y,"Dominos",obj_bola)
    bola.depth--
    global.go=false
}