startEstrada=0
hsp=0
vsp=0
spd=2
way=0
angle=""

stateParado=function(){
    x=global.firstPath.x
    y=global.firstPath.y
    
    var _domino=instance_place(x, y, obj_domino)
    if (_domino && (_domino.state == _domino.stateFalled || _domino.state == _domino.stateFalling)){
        state=stateGo
        var path=instance_nearest(x,y,obj_caminho)
        if path.way == "horizontal"{
            
            if _domino.image_angle >= 135 && _domino.image_angle <= 225{
                angle = "esquerda"
            }
            if _domino.image_angle == 0 or _domino.image_angle == 45 or _domino.image_angle == 315{
                angle = "direita"
            }
            
        }else if way == "vertical"{
            
            if _domino.image_angle >= 45 && _domino.image_angle <= 135{
                angle = "cima"
            }
            if _domino.image_angle >= 225 && _domino.image_angle <= 315{
                angle = "baixo"
            }
            
        }
    }
}

stateGo=function(){
    var path=instance_nearest(x,y,obj_caminho)
    var _dist=point_distance(x,y,path.x, path.y)
    if _dist<2{
        switch path.way{
            case "horizontal":
                if angle == "esquerda"{
                    hsp = -2
                }else{
                    hsp = 2
                }
            break
            case "vertical":
                if angle == "cima"{
                    vsp = -2
                }else{
                    vsp = 2
                }
            break
            case "rightDown":
                if ((hsp == -2 && vsp==0) && !(hsp == 0 & vsp=2)){
                    hsp=0
                    vsp=2
                    angle = "baixo"
                }else{
                    hsp=2
                    vsp=0
                    angle = "direita"
                }
            break
            case "rightUp":
                if ((hsp == -2 && vsp==0) && !(hsp == 0 & vsp=-2)){
                    vsp=-2
                    hsp=0
                    angle = "cima"
                }else{
                    hsp=2
                    vsp=0
                    angle = "direita"
                }
            break
            case "leftDown":
                if ((hsp == 2 && vsp==0) && !(hsp == 0 & vsp=2)){
                    vsp=2
                    hsp=0
                    angle = "baixo"
                }else{
                    hsp=-2
                    vsp=0 
                    angle = "esquerda"
                }
            break
            case "leftUp":
                if ((hsp == 2 && vsp==0) && !(hsp == 0 & vsp=-2)){
                    vsp=-2
                    hsp=0
                    angle = "cima"
                }else{
                    hsp=-2
                    vsp=0
                    angle = "esquerda"
                }
            break
        }
    }
    
    var _domino=instance_place(x,y,obj_domino)
    if _domino and (_domino.state==_domino.stateParado){
        _domino.state=_domino.stateFalling
        state=stateBateu
    }
}

stateBateu=function(){
    hsp=0
    vsp=0
}

state=stateParado