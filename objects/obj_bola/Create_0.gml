velh = 0;
velv = 0;

spd = 1.5;
dir = 0;

meu_estrada = noone;

domino = 0;


stateParado = function()
{
    if (meu_estrada)
    {
        x = meu_estrada.x - 5;
        y = meu_estrada.y;
    }
    
    if (instance_exists(obj_domino))
    {
        domino = instance_place(x,y,obj_domino);
    }
    
    if (domino)
    {
        if (domino.state=domino.stateFalled or domino.state=domino.stateFalling)
        {
            state = stateMoving;
        }
    }
    
}

stateMoving = function()
{
    meu_estrada = instance_place(x, y, obj_caminho_reto);
    dir = meu_estrada.image_angle;
    velh = lengthdir_x(spd, dir);
    velv = lengthdir_y(spd, dir);
    
    
    x += velh;
    y += velv;
}


state = stateParado;