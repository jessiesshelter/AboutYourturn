if target != noone{
	for (var i = 0; i < options; ++i) {
		//Button
		draw_set_colour(c_black);
		draw_rectangle(
			target.x + OFFSET_X, target.y + OFFSET_Y + B_GAP * i,
			(target.x + OFFSET_X + RECTANGLE_WIDTH), (target.y + OFFSET_Y + RECTANGLE_HEIGHT + B_GAP * i),
			false
		);
		
		//Text
		draw_set_colour(c_white);
		draw_text(target.x + OFFSET_X, target.y + OFFSET_Y + B_GAP * i, option[i])
	}
}