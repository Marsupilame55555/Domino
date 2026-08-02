
if global.dm_atual!=noone{
    var index=1
}else{
    var index=0
}
draw_sprite(spr_cursor, index, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))