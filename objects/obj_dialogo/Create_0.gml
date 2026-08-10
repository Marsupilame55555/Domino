text[0]=""
digitos=0
index=0
timer=180
go=false

switch room{
    case Tutorial00:
        text[0]="Você consegue criar e mexer dominós usando o botão esquerdo"
        text[1]="Para mudar de material ou apagar um dominó usando a lixeira use o Scroll do mouse"
        text[2]="Aperte espaço para empurrar os dominós"
    break
    
    case Fase1:
        text[0]="Agora você pode criar caminhos que aquela bola seguirá"
        text[1]="Você também tem portas que são abertas com o botão azul"
    break
    
    case Fase2:
        text[0]="Agora você pode usar um canhão que atira dominós"
        text[1]="Ative-o ao apertar o botão vermelho"
    break
}