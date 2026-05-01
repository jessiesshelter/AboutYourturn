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
			
			
		//TurnReset
			if (turnCount >= partyNumber){
	            turnCount = 0;
	            combatState = state.check;
				waitNext = state.enemyturn;
				obj_battlemenu.target = noone;
				alarm[0] = 60;
			}
			
		//Checks if the ally is down
			if global.PartyMembers[turnCount].ALIVE != true{
				turnCount++;
			}
			
		obj_battlemenu.target = global.PartyMembers[turnCount]; //BRO MY PC-C-C-C
    break; #endregion

	#region Check
    case state.check: 

		#region Battle Ending Contidion Check

	
		for (var i = 0; i < array_length(enemy)-1; ++i) {
		    
			if enemy[i].HP == 0 {
				instance_destroy(enemy[i]);
				enemy[i] = 0;
				}		
			
		}
		
		for (var i = 0; i < array_length(global.PartyMembers)-1; ++i) {
		    
			if global.PartyMembers[i].HP == 0 {
				global.PartyMembers[i].ALIVE = false;
				}		
			
		}
		
		

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
		
	
	//TurnReset (Enemy)
		if (turnCount >= eAmount){
	        turnCount = 0;
	        combatState = state.check;
			waitNext = state.playerturn;
		} else {

		
			//
			if enemy[turnCount] == 0{
				turnCount++
			}
			

		    var _turnOwner = enemy[turnCount];
		    turnCount++;
			Attack(_turnOwner, global.PartyMembers[irandom_range(0, (partyNumber-1))]);
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