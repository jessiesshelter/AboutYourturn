
image_alpha = (HP/10)*1

var tvspd;
var thspd;
var hspd;
var vspd;




hspd = (keyboard_check(global.keys.right)-keyboard_check(global.keys.left))
vspd = (keyboard_check(global.keys.down)-keyboard_check(global.keys.up))

thspd = hspd * SPD
tvspd = vspd * SPD



show_debug_message(SPD)
if hspd != 0 && SPD < 6 {
	SPD += ACL;
		x += thspd
	stopping = 1;
	dir = hspd;
	} 
	if SPD >= 6 && hspd != 0 {	x += thspd}
	
	if hspd == 0 && stopping > -0.9 && SPD >= 1{
		x += (SPD*stopping)*dir
		stopping -= 0.1;
		SPD -= 1;
	}

if vspd != 0 {
	y += tvspd 
	}
	if vspd == 0 {
		
	}
	
	



/*
if abs(hspd) + abs(vspd) >= 1 {
	if SPD < 6 {
	SPD += ACL*SPD/4
	}
	
} else {
	SPD = 1;
	}

tvspd = vspd;
thspd = hspd;
