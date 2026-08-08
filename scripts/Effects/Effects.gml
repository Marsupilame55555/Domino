function audio_sound_pitch_range(_som, _variacaoPitch=0.1){
    var _pitch=1+random_range(-_variacaoPitch, _variacaoPitch)
    audio_play_sound(_som, 0, 0, , ,_pitch)
}

function create_spring_effect(){
    xscale=1
    yscale=1
}

function spring_effect(_xscale, _yscale){
    xscale=_xscale
    yscale=_yscale
}

function return_spring(_qtd){
    yscale=lerp(yscale, 1, _qtd)
    xscale=lerp(xscale, 1, _qtd)
}

function draw_spring_effect(){
    draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
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