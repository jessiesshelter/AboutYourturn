#region Vertical Selec Movement
	ySelection += keyboard_check_pressed(global.keys.down) - keyboard_check_pressed(global.keys.up);
	
	//Looping options
if ySelection > optionsNum-1{
		ySelection = 0;
	}
	
if ySelection < 0{
		ySelection = optionsNum-1;
	}
#endregion
	
#region Horizontal Selec Movement
	xSelection += keyboard_check_pressed(global.keys.right) - keyboard_check_pressed(global.keys.left);
	
	//Looping options
if xSelection > optionsNum-1{
		xSelection = 0;
	}
	
if xSelection < 0{
		xSelection = optionsNum-1;
	}
	
#endregion

switch(ySelection){
	case 0: //FIGHT

		if keyboard_check_pressed(global.keys.confirm){
			menuState = mState.targets
			
			if menuState == mState.targets {
					obj_battle.turnCount++
			}
		}
	break;
	
	case 1: //SKILLS
	
	break;
	
	case 2: //ITENS
	
	break;
	
	case 3: //RUN
	
	break;
}