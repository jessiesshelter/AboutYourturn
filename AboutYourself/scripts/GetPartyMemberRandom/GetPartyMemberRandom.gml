function GetPartyMemberRandom(rangeMax, rangeMin = 0){
	return global.PartyMembers[irandom_range(0,	rangeMax)]
}