//Batalha
enum state{
    init, //Carrega os dados do combate 0
    playerturn, //Escolhas do player 1
    playerexecution, //Consequências das escolahs 2
    wait, //Pausa 3
    check, //Checa se a batalha acabaria 4
    enemyturn, //IA dos inimigos
    enemyexecution, //Turno de esquiva caso possível
    win, //Caso ganhe a luta
    gameover //Caso perca a luta
}

combatState = state.init;
enemies = [];
enemy = [];
eAmount = 2
turnCount = 0;
turnOwner = noone;
turnTarget = noone;

//Party
for(var i = 0; i < instance_number(obj_player); i++){
	global.PartyMembers[i] = instance_find(obj_player,i);
}

partyNumber = array_length(global.PartyMembers)

//Keybinding (temporario)
confirmKey = keyboard_check_pressed(vk_enter)

//Posições
allyX = room_width/3;
allyY = room_height/2;

#macro GAP 32

