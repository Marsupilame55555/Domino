draw_set_colour(c_black)
draw_set_font(Font1)
draw_set_halign(fa_center)

var texto=string_copy(text[index], 0, digitos)
draw_text(675, 700, texto)

draw_set_colour(-1)
draw_set_font(-1)
draw_set_halign(-1)