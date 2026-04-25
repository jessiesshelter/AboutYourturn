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
eAmount = 3;
turnCount = 0;
turnOwner = noone;
turnTarget = noone;

//Keybinding (temporario)
confirmKey = keyboard_check_pressed(vk_enter)