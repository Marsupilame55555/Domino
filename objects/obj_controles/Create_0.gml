collisionList=[obj_domino, obj_finger, obj_block, obj_door, obj_buttonPar, obj_canhao, obj_caminho, obj_caminho_1]

objects=[obj_domino];

quantidadeObjetos=[qtdDominos, qtdCaminhos, qtdCanhoes]

objectIndex=0
objectEquiped=0

if !audio_is_playing(snd_song){
    audio_play_sound(snd_song, 0, true)
}