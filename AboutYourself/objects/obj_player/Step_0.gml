image_alpha = (HP/10)*1

var tvspd;
var thspd;
var hspd;
var vspd;

hspd = (keyboard_check(global.keys.right)-keyboard_check(global.keys.left))
vspd = (keyboard_check(global.keys.down)-keyboard_check(global.keys.up))

x += hspd * SPD
y += vspd * SPD



if abs(hspd) + abs(vspd) >= 1 {
	if SPD < 6 {
	SPD += ACL*SPD
	}
} else {
	SPD = 1;
	}

tvspd = vspd;
thspd = hspd;
