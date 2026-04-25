if target != noone{
	for (var i = 0; i < optionsNum; ++i) {
		
		//Button
		draw_set_colour(c_black);
		draw_rectangle(
			target.x + OFFSET_X, target.y + OFFSET_Y + B_GAP * i,
			(target.x + OFFSET_X + RECTANGLE_WIDTH), (target.y + OFFSET_Y + RECTANGLE_HEIGHT + B_GAP * i),
			false
		);
		
		//Text
			//Selection Color
			if (ySelection == i){
			draw_set_colour(c_red);
			} else {	draw_set_colour(c_white);	};
			
		draw_text(target.x + OFFSET_X, target.y + OFFSET_Y + B_GAP * i, options[i]);
	}
}