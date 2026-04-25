enum mState {
	playerchoices,
	targets
}

target = noone;

options = ["Fight","Skills","Itens","Run"];
optionsNum = array_length(options);
menuState = mState.playerchoices
ySelection = 0;
xSelection = 0;

#macro OFFSET_X 16
#macro OFFSET_Y -64
#macro B_GAP 32
#macro RECTANGLE_WIDTH 64
#macro RECTANGLE_HEIGHT 16