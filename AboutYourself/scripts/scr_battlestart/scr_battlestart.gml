function scr_battlestart(amount,enemy1,enemy2,enemy3,background,music){
	
	
	if amount == 1 {
	instance_create_layer(256,192,"Instances",enemy1);
	show_debug_message(enemy1)
	} if amount == 2 {
	instance_create_layer(256,192,"Instances",enemy1);
	instance_create_layer(544,192,"Instances",enemy2);
	show_debug_message(enemy1)
	} if amount == 3 {
	instance_create_layer(256,192,"Instances",enemy1);
	instance_create_layer(544,192,"Instances",enemy2);
	instance_create_layer(864,192,"Instances",enemy3);
	show_debug_message(enemy1)
	}
	
	//with (instance_create_layer(256,192,"Instances",obj_battle)) {
	//amount = other.amount;
	//enemy1 = other.enemy1;
	//enemy2 = other.enemy2;
	//enemy3 = other.enemy3;
	//}
	
	
}