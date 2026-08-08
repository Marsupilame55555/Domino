draw_sprite(spr_iconsDomino, obj_controles.objectEquiped, 32, 24)

if (!global.lixo)
{
    if global.dm_atual!=noone{
        var index=cursor.Segurando;
    }else if global.dm_atual==noone{
        var index=cursor.Livre;
    }
}else
{
    var index=cursor.Delete;
}

draw_sprite(spr_cursor, index, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))