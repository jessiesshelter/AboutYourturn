function GetYPosition(baseY, gap, total, index){
	return baseY - gap * (total - 1) + (gap * 2 * index);
}