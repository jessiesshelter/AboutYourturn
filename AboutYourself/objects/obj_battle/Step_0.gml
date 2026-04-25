switch(combatState){
    case state.init:  
	
        //Posicionamento de inimigos
        for (var i = 0; i < eAmount; i++) {
            enemy[i] = instance_create_layer(100, 32 * i, "Enemies", obj_enemy); //Cria os inimigos e os separa por array
            array_push(enemies, enemy[i]); //Adiciona os em uma lista de inimigos usada para INICIATIVA.
        }

        //Posicionamento de aliados
		for (var i = 0; i < partyNumber; i++) {
		    global.PartyMembers[i].x = allyX;
		    global.PartyMembers[i].y = (allyY - GAP * (partyNumber - 1)) + (GAP * 2 * i);
		}

		// Vai pro turno do player
        combatState = state.playerturn; 
    break;

    case state.playerturn:  
		
		//Se o contador de qm eh o turno for maior q o numero de aliados ele reseta e vai pros oponentes
        if (turnCount >= partyNumber){
            turnCount = 0;
            combatState = state.wait;
			alarm[0] = 60;
        }
		
        //Todo novo ciclo ele atualiza pra poder verificar depois caso haja alteração
        var _turnCountTemp = turnCount
        if keyboard_check_pressed(vk_enter){
            turnCount++;
        }
		
        if _turnCountTemp != turnCount{
            //Anuncia o turno (por debug msm)
            //show_debug_message("Ally turn " + string(turnCount)); --> Turno 3 = passe a vez
            //Dá ao turno um dono
            turnOwner = global.PartyMembers[turnCount-1]; 
            //Eu n sei como fazer mas amaria q ele n definisse o owner toda hr por otimização
            //Supostamente resolvido mas agr ele n executa avisando no primeiro turno exclusivamente
        }


    break;

    case state.wait: 
	
	if alarm[0] < 0 {
	combatState = state.check;
	alarm[0] = 60 
	}
	
    break;

    case state.check: 
		//Se n tiver inimigo dá a vitória
		if array_length(enemies) <= 0{
			combatState = state.win
		} else //Se não...
		{
			combatState = state.enemyturn
		}
		
    break;

    case state.enemyturn:  
    
		//Conta se ja passou por todos os oponentes e da o turno ao player
        if (turnCount >= array_length(enemies)){
            turnCount = 0;
            combatState = state.playerturn;
        }
		
        var _eTurnCountTemp = turnCount
        if keyboard_check_pressed(vk_enter){
            turnCount++;
        }
		
        if _eTurnCountTemp != turnCount{
            //Dá ao turno um dono
            turnOwner = enemies[turnCount-1]; 
			Attack(turnOwner, global.PartyMembers[irandom_range(0, (partyNumber-1))]) //Sorteia um party member e bate nele
			//show_message("atacou")
        }
	
    break;

    case state.win:  
		//ganhou = legal, faz dnv
		game_restart();

    break;

    case state.gameover:  
		//major skill issue
		game_end();
    break;
}