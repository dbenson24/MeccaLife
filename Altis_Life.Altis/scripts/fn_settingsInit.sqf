/*/////////////////////////////////////////|//////////
//_______________________////////////////__|__////////
/|Made for ZoXXen.com    |/////////////____|____//////
/|Author:GamerDF         |///////////______|______////
/|Description: too lazy  |/////////////____|____//////
/|_______________________|///////////////  |  ////////
*////////////////////////////////////////~~|~~////////

zoXXen_foot = viewDistance;
zoXXen_car = viewDistance;
zoXXen_air = viewDistance;
zoXXen_addon_disable = true;

[] spawn
{
	private["_recorded"];
	while {true} do
	{
		_recorded = vehicle player;
		if(vehicle player != _recorded OR !alive player) then {
			[] call life_fnc_updateViewDistance;
		};
		sleep 2.2;
	};
};