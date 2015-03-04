/*/////////////////////////////////////////|//////////
//_______________________////////////////__|__////////
/|Made for ZoXXen.com    |/////////////____|____//////
/|Author:GamerDF         |///////////______|______////
/|Description: too lazy  |/////////////____|____//////
/|_______________________|///////////////  |  ////////
*////////////////////////////////////////~~|~~////////

disableSerialization;
private["_display","_titel"];

while {true} do
{
	waitUntil {!isNull (findDisplay 6800)};
	_display = findDisplay 6800;
	_titel = _display displayCtrl 6801;
	_fps = diag_fps;
	_titel ctrlSetText format ["Settings [FPS:%1]",round _fps];
	sleep 0.5;
};