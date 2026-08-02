function audio_sound_pitch_range(_som, _variacaoPitch=0.1){
    var _pitch=1+random_range(-_variacaoPitch, _variacaoPitch)
    audio_play_sound(_som, 0, 0, , ,_pitch)
}


function screenShake(_treme)
{
    if (!instance_exists(obj_sreenShake))
    {
        instance_create_depth(0, 0, 1, obj_sreenShake);
    }
    
    if (obj_sreenShake.treme < _treme)
    obj_sreenShake.treme = _treme;

}