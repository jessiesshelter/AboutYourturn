draw_text(0,0,"Combat State: " + string(combatState))
draw_text(0,32,"Turn Count: " + string(turnCount))
draw_text(0,64,"Selection: " + string(obj_battlemenu.Selection))

draw_text(0,96,"Party Members Array live reaction: " );
for (var i = 0; i < array_length(global.PartyMembers); ++i) {
	draw_text(0,96+(16*(i+1)),string(global.PartyMembers[i]));
}