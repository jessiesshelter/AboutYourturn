switch(combatState){
    case state.init:  
        //Posicionamento de inimigos
        for (var i = 0; i < eAmount; i++) {
            enemy[i] = instance_create_layer(100, 32 * i, "Enemies", obj_enemy); //Cria os inimigos e os separa por array
            array_push(enemies, enemy[i]); //Adiciona os em uma lista de inimigos usada para INICIATIVA.
        }

        //Posicionamento de aliados
        for (var i = 0; i < array_length(global.PartyMembers); i++) {
                global.PartyMembers[i].x = 0; // X dos aliados
                global.PartyMembers[i].y = 32 * i; // Y dos aliados
        }

        combatState = state.playerturn; // Vai pro turno do player
    break;

        case state.playerturn:  
        //Todo novo ciclo ele atualiza pra poder verificar depois caso haja alteração
        var _turnCountTemp = turnCount
        
		//if keyboard_check_pressed(vk_enter) {show_debug_message("AERTOU")}
        if keyboard_check_pressed(vk_enter){
            turnCount++;
        }
		

        if _turnCountTemp != turnCount{
            //Anuncia o turno (por debug msm)
            show_debug_message("Ally turn " + string(turnCount));
            //Dá ao turno um dono
            turnOwner = global.PartyMembers[turnCount]; 
            //Eu n sei como fazer mas amaria q ele n definisse o owner toda hr por otimização
            //Supostamente resolvido mas agr ele n executa avisando no primeiro turno exclusivamente
        }
        
        //Se o contador de qm eh o turno for maior q o numero de aliados ele reseta e vai pros oponentes
        // ele tem +1 pq ele começa no 0
        if (turnCount+2 > array_length(global.PartyMembers)){
            turnCount = 0;
            combatState = state.wait;
			alarm[0] = 300;
        }

    break;

    case state.wait: 
	
	show_debug_message(alarm_get(0))
	if alarm[0] < 0 {
	combatState = state.check;
	alarm[0] = 300 
	}
	
    break;

    case state.check:  
    
    break;

    case state.enemyturn:  
    
    break;

    case state.win:  
    
    break;

    case state.gameover:  
    
    break;
}