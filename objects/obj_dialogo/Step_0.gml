if digitos<string_length(text[index]){
    if go=false{
        digitos++
    }else{
        digitos--
        if digitos<=0{
            if array_length(text)-1>index{
                index++
                timer=180
                digitos=0
                go=false
            }else{
                instance_destroy()
            }
        }
        
        
    }
    
}
if digitos=string_length(text[index]){
    timer--
    if timer<=0{
        digitos--
        go=true
    }
}
