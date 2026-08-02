draw_self();

if (global.dm_atual)
{
    draw_sprite_ext(spr_seta, 0, room_width/2, 20, 1, 1, global.dm_atual.image_angle, c_white, 1);
}
