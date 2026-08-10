#macro CELL_SIZE 8

global.dm_atual=noone
global.est_atual=0
global.go=0


global.hitstop = false;
global.pd_hitstop = true;

global.firstPath=noone

global.obj_livres =
{
    caminho : false,
    canhao  : false
}

function obj_act(caminho = false, canhao = false)
{
    global.obj_livres.caminho = caminho;
    global.obj_livres.canhao = canhao;
}


global.transition = true;

enum MODE {
    on,
    off
}