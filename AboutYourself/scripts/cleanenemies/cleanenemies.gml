function cleanenemies(){
	for (var i = 0; i > array_lenght(obj_battle.enemy)-1 ; ++i) {
			if instance_exists(obj_enemy)
			{
			 array_delete(obj_battle.enemy, i, 1);				
			}
	}
}