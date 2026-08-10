var _indexIcon=0;
switch obj_controles.objectEquiped{
    case obj_caminho:
        _indexIcon=1
    break   
    case obj_canhao:
        _indexIcon=2
    break  
    case obj_lixo:
        _indexIcon=3
    break
}

if canDraw{
    draw_sprite(spr_iconsDomino, _indexIcon, 32, 24)
    
    if obj_controles.objectEquiped!=obj_lixo{
        draw_set_valign(fa_middle)
        draw_set_font(fonte)
        
        var quantitiy=obj_controles.quantidadeObjetos[obj_controles.objectIndex]
        draw_text_transformed(150, 90, string(quantitiy), xscale, yscale, 0)
        
        draw_set_font(-1)
        draw_set_valign(-1)
    }
}

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