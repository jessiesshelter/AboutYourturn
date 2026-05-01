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
			
		if keyboard_check_pressed(global.keys.cancel) && turnCount > 0{
			turnCount--
		}

		//TurnReset
			if (turnCount >= partyNumber){
	            turnCount = 0;
	            combatState = state.check;
				waitNext = state.enemyturn;
				obj_battlemenu.target = noone;
				alarm[0] = 60;
			}
			
		//Checks if the ally is down
			if global.PartyMembers[turnCount].HP <= 0{
				turnCount++;
			}
			
		obj_battlemenu.target = global.PartyMembers[turnCount]; //BRO MY PC-C-C-C
    break; #endregion

	#region Check
    case state.check: 
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
			if enemy[turnCount].HP <= 0{
				turnCount++
			}
			
		    var _turnOwner = enemy[turnCount];
			script_execute(enemy[turnCount].AIBehavior, //Script
				_turnOwner, //Attacker
				global.PartyMembers[irandom_range(0,array_length(global.PartyMembers)-1)] //Target
			);
		    turnCount++; //Let this be the last thing :D
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