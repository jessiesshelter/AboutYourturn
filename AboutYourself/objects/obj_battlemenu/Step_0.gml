#region Selec Movement
	Selection += keyboard_check_pressed(global.keys.down) - keyboard_check_pressed(global.keys.up);
	Selection += keyboard_check_pressed(global.keys.right) - keyboard_check_pressed(global.keys.left);
	
	//Looping options
if Selection > optionsNum-1{
		Selection = 0;
	}
	
if Selection < 0{
		Selection = optionsNum-1;
	}
#endregion
	

switch(menuState){

	case mState.playerchoices: //Player's Options

	switch(Selection){
		case 0: //FIGHT
			if keyboard_check_pressed(global.keys.confirm){
				menuState = mState.targets
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
		optionsNum = array_length(obj_battle.enemy);
		
		if keyboard_check_pressed(global.keys.confirm){
				optionsNum = array_length(options);
				menuState = mState.playerchoices;
				obj_battle.turnCount++;
		}
	break;
}