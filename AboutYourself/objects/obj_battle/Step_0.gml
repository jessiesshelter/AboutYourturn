switch(combatState){
	
	#region Initiation
    case state.init:  
	
        #region Positions
        for (var i = 0; i < eAmount; i++) {
            enemy[i] = instance_create_layer(enemyX, (enemyY - GAP * (eAmount - 1)) + (GAP * 2 * i),
			"Enemies", obj_enemy
			);
        }

		for (var i = 0; i < partyNumber; i++) {
		    global.PartyMembers[i].x = allyX;
		    global.PartyMembers[i].y = (allyY - GAP * (partyNumber - 1)) + (GAP * 2 * i);
		}

		#endregion
        combatState = state.playerturn; 
		
    break; #endregion

	#region Player's Turn
    case state.playerturn:  
        //TurnCicles
		if keyboard_check_pressed(confirmKey){
		    turnOwner = global.PartyMembers[turnCount];
		    turnCount++;
		//TurnReset
			if (turnCount >= partyNumber){
	            turnCount = 0;
	            combatState = state.check;
				waitNext = state.enemyturn;
				alarm[0] = 60;
			}
		}
    break; #endregion

	#region Check
    case state.check: 
		#region Battle Ending Contidion Check
			//There's no enemies left
			if array_length(enemy) == 0
			{
				checkNext = state.win;
			} 
			//There's no allies left
			else if 0 == 1 //Idk how to condicionate to a player lost
			{
				checkNext = state.gameover;
			} 
			else // The battle continues
			{
				checkNext = state.wait;
			} 
		#endregion
		combatState = checkNext;
    break; #endregion

	#region Wait
    case state.wait: 
		//Pauses
		if alarm[0] <= 0 {
			combatState = waitNext;
			alarm[0] = 60 
		}
    break; #endregion

	#region Enemy's Turn
    case state.enemyturn:  
		
		//TurnCicles (Enemy)
		if keyboard_check_pressed(confirmKey){
		    turnOwner = enemy[turnCount];
		    turnCount++;
			Attack(turnOwner, global.PartyMembers[irandom_range(0, (partyNumber-1))])
		//TurnReset (Enemy)
			if (turnCount >= eAmount){
	            turnCount = 0;
	            combatState = state.check;
				waitNext = state.playerturn;
			}
		}
    break; #endregion

	#region Battle's Ending
    case state.win:  
		//Win consequence
		game_restart();

    break;

    case state.gameover:  
		//Game over consequence
		game_end();
    break; #endregion
}