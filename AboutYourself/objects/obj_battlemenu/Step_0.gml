#region Selec Movement
	Selection += keyboard_check_pressed(global.keys.down) - keyboard_check_pressed(global.keys.up);
	Selection += keyboard_check_pressed(global.keys.right) - keyboard_check_pressed(global.keys.left);
#endregion

switch(menuState){

	case mState.playerchoices: //Player's Options

	//Looping options
	loop(optionsNum);

	switch(Selection){
		case 0: //FIGHT
			if keyboard_check_pressed(global.keys.confirm){
				enemyNum = array_length(obj_battle.enemy);
				menuState = mState.targets;
				Selection = 0;
				
			}
		
		
		break;
	
		case 1: //SKILLS
			//enemyNum = array_length(obj_battle.enemy);
	
		break;
	
		case 2: //ITENS
	
		break;
	
		case 3: //RUN
	
		break;
	} break;
	
	case mState.targets: //Chosing targets
		
	//Looping targets
	loop(enemyNum);
		
		if keyboard_check_pressed(global.keys.confirm){
				menuState = mState.playerchoices;
				obj_battle.turnCount++;
				Selection = 0;
		}
		if keyboard_check_pressed(global.keys.cancel){
				menuState = mState.playerchoices;
				Selection = 0;
		}
	break;
}