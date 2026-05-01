//Batalha
enum state{
    init, //Start
    playerturn, //Player's Choices
    playerexecution, //Player Strikes
    wait, //Pauses
    check, //Check for an end
    enemyturn, //Enemy's Choices
    enemyexecution, //Enemy Strikes
    win, //End the fight with a win
    gameover //Make the game over
}

combatState = state.init;
enemy = [];
eAmount = 2
turnCount = 0;
turnTarget = noone;

waitNext = state.enemyturn;
checkNext = state.wait;

//Party (temp)
for(var i = 0; i < instance_number(obj_player); i++){
	global.PartyMembers[i] = instance_find(obj_player,i);
}

partyNumber = array_length(global.PartyMembers)

//Positions
allyX = room_width/3;
allyY = room_height/2;
enemyX = room_width/3 * 2;
enemyY = room_height/2;

#macro Enemy_Y_GAP 32

