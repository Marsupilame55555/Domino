function audio_sound_pitch_range(_som, _variacaoPitch=0.1){
    var _pitch=1+random_range(-_variacaoPitch, _variacaoPitch)
    audio_play_sound(_som, 0, 0, , ,_pitch)
}