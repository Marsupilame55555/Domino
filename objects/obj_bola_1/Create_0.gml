startEstrada=0
hsp=0
vsp=0
spd=2
way=0
angle=""
a=0

stateParado=function(){
    
    hsp=0
    vsp=0
    stateText="Parado"
    
    x=firstPath.x
    y=firstPath.y
    
    var _domino=instance_place(x, y, obj_domino)
    if (_domino && (_domino.state == _domino.stateFalled || _domino.state == _domino.stateFalling)){
        state=stateGo
        var path=instance_nearest(x,y,obj_caminho_1)
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
    stateText="Rola"
    
    var _dist=0
    var path=instance_nearest(x,y,obj_caminho_1)
    
    if instance_exists(obj_caminho){
        path=instance_nearest(x,y,obj_caminho)
        _dist=point_distance(x,y,path.x, path.y)
    }
    
    
    var path1=instance_nearest(x,y,obj_caminho_1)
    var _dist1=point_distance(x,y,path1.x, path1.y)
    
    var go=false
    
    if _dist<2{
        go=true
    }else{ 
        if _dist1<2{
            go=true
            path=path1
            _dist=_dist1
        }
        
    }
    
    if go{
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
        if hsp>0{
            _domino.image_angle=0
        }else if hsp<0{
            _domino.image_angle=180
        }else if vsp>0{
            _domino.image_angle=270
        }else if vsp<0{
            _domino.image_angle=90
        }
        audio_play_sound(snd_domino, 1, false)
        screenShake(15)
    }
    
    if place_meeting(x,y,obj_block) or place_meeting(x,y,obj_door) or place_meeting(x,y,obj_canhao){
        state=stateBateu
    }
}

stateBateu=function(){
    stateText="Bati"
    hsp=0
    vsp=0
}

state=stateParado