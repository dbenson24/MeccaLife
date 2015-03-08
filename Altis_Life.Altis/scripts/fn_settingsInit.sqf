/*
	file: fn_settingsInit.sqf
*/

mecca_foot = viewDistance;
mecca_car = viewDistance;
mecca_air = viewDistance;
mecca_addon_disable = true;

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