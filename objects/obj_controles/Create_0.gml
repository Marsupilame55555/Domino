collisionList=[obj_domino, obj_finger, obj_block, obj_door, obj_buttonPar, obj_canhao, obj_caminho]
objects=[obj_domino, obj_lixo];
if room==Fase1{
    array_push(objects, obj_caminho)
}else if room== Fase4{
    array_push(objects, obj_canhao)
}
objectEquiped=0