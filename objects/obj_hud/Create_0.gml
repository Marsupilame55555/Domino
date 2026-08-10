window_set_cursor(cr_none)
xscale=1
yscale=1

enum cursor {
    Livre,
    Segurando,
    Delete
};

fonte = font_add_sprite_ext(spr_font, "0123456789/", true, 4)

canDraw=false