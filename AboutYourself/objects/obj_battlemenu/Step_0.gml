#region Selec Movement
	Selection += keyboard_check_pressed(global.keys.down) - keyboard_check_pressed(global.keys.up);
	Selection += keyboard_check_pressed(global.keys.right) - keyboard_check_pressed(global.keys.left);
#endregion

switch(menuState){

	case mState.playerchoices: //Player's Options

	//Looping options
	if Selection > optionsNum-1{
			Selection = 0;
		}
	
	if Selection < 0{
			Selection = optionsNum-1;
	}

	switch(Selection){
		case 0: //FIGHT
			if keyboard_check_pressed(global.keys.confirm){
				menuState = mState.targets;
				Selection = 0;
			}
		
		break;
	
		case 1: //SKILLS
	
		break;
	
		case 2: //ITENS
	
		break;
	
		case 3: //RUN
	
		break;
	} break;
	
	case mState.targets: //Chosing targets
		
	//Looping targets
	if Selection > enemyNum-1{
			Selection = 0;
		}
	
	if Selection < 0{
			Selection = enemyNum-1;
	}
		
		if keyboard_check_pressed(global.keys.confirm){
				menuState = mState.playerchoices;
				obj_battle.turnCount++;
				Selection = 0;
		}
	break;
}