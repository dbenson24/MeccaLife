#include <macro.h>
/*
	File: fn_upgradeMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens & initializes the chop shop menu.
*/
if(life_action_inUse) exitWith {hint localize "STR_NOTF_ActionInProc"};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car","Truck","Air","Ship"],25];

//Error check
if(EQUAL(count _nearVehicles,0)) exitWith {titleText["No Vehicle Near to Upgrade","PLAIN"];};
if(!(createDialog "Life_upgrade_car")) exitWith {hint "Upgrade Menu Error"};

_display = findDisplay 5500;
_trunkslider = 5501;
_trunklevel = 5511;
_insslider = 5502;
_inslevel = 5512;
_securecheck = 5503;
_hookcheck = 5504;
_gpscheck = 5505;

sliderSetRange [_trunkslider, 0, 4];
sliderSetRange [_insslider, 0, 3];

sliderSetSpeed [_trunkslider, 1, 1];
sliderSetSpeed [_insslider, 1, 1];

/*
_control = CONTROL(39400,39402);
{
	if(alive _x) then {
		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		
		_price = M_CONFIG(getNumber,CONFIG_VEHICLES,_className,"price");
		_price = round(0.9 * _price);
		if(!isNil "_price" && EQUAL(count crew _x,0)) then {
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_price];
		};
	};
} foreach _nearVehicles;
*/