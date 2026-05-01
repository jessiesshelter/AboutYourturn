switch(combatState){
	
	#region Initiation
    case state.init:  
	
        #region Positions
        for (var i = 0; i < eAmount; i++) {
            enemy[i] = instance_create_layer(enemyX, GetYPosition(enemyY,Enemy_Y_GAP,eAmount,i),
			"Enemies", obj_enemy
			);
        }

		for (var i = 0; i < partyNumber; i++) {
		    global.PartyMembers[i].x = allyX;
		    global.PartyMembers[i].y = GetYPosition(allyY,Enemy_Y_GAP,partyNumber,i);
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
				alarm[0] = 30;
			}
		
		//Checks if the ally is down
			var member = global.PartyMembers[turnCount]
		
			if member.HP <= 0{
				turnCount++;
				break;
			}
		
			obj_battlemenu.target = member; //BRO MY PC-C-C-C
				
    break; #endregion

	#region Check
    case state.check: 
			//There's no enemies left
			if array_length(enemy) == 0
			{
				checkNext = state.win;
			} 
			//There's no allies left
			var _alive = 0;
			for (var i = 0; i < array_length(global.PartyMembers); ++i) {
				if global.PartyMembers[i].HP > 0{	_alive++	}
			}
			if _alive == 0{	checkNext = state.gameover	}
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
			alarm[0] = 30 
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
			
			// Checks Enemy Down
			if enemy[turnCount].HP <= 0{
				turnCount++
				break;
			}
			
		    var _turnOwner = enemy[turnCount];
			enemy[turnCount].AIBehavior(_turnOwner, GetPartyMemberRandom(array_length(global.PartyMembers)-1)); //Script
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