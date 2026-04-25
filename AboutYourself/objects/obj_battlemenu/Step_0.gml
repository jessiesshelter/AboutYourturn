#region Vertical Selec Movement
	ySelection += keyboard_check_pressed(global.keys.down) - keyboard_check_pressed(global.keys.up);
	if ySelection > optionsNum{
		
	}
	#endregion

//Targets (temp)
if (obj_battle.combatState == state.playerturn) {
	target = global.PartyMembers[obj_battle.turnCount];
} else {
	target = noone;
}

if keyboard_check_pressed(global.keys.confirm){

}