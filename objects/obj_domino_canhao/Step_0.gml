

velv += grv


x += velh;
y += velv;


image_angle += spd;



var domino=instance_place(x,y,obj_domino)

if ((domino and domino.state=domino.stateParado) && global.go){
    with (domino) {
    	state=stateFalling;
        // image_angle=other.dir;
        obj_finger.timer = 100;
        
        
    }
    
    screenShake(20)
    audio_sound_pitch_range(snd_domino, 0.15)
    
    velv=-3
    velh=-3*sign(velh)
}