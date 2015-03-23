#include <macro.h>
/*
	File: fn_upgradeMenu.sqf
	Author: Derek
	
	Description:
	Opens & initializes the car upgrade menu
*/
if(life_action_inUse) exitWith {hint localize "STR_NOTF_ActionInProc"};
disableSerialization;
private["_nearVehicles","_control","_vehicle","_vehData","_vehOwner","_trunkslider","_trunklevel","_insslider","_inslevel","_securecheck","_hookcheck","_gpscheck"];


if(vehicle player != player) then
{
	_vehicle = vehicle player;
} else {
	_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car","Truck","Air","Ship"],25];

	//Error check
	if(EQUAL(count _nearVehicles,0)) exitWith {titleText["No Vehicle Near to Upgrade","PLAIN"];};
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			diag_log format ["Vehicle Data: %1",_vehData];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				diag_log format ["Vehicle Owner: %1",_vehOwner];
				diag_log format ["Player: %1",getPlayerUID player];
				
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
					upgradeVehicle = _vehicle;
					diag_log format["Vehicle Selected: %1",_vehicle];
				};
			};
		} foreach _nearVehicles;
	};
};

diag_log format["Vehicle after loop exit: %1",_vehicle];
diag_log format["Vehicle after loop exit upgv: %1",upgradeVehicle];

if(isNil "_vehicle") exitWith {hint "You don't own that vehicle"};
if(isNull _vehicle) exitWith {};

//upgradeVehicle = _vehicle;

if(!(createDialog "Life_upgrade_car")) exitWith {hint "Upgrade Menu Error"};



_display = findDisplay 5500;
_trunkslider = 5501;
_trunklevel = 5511;
_insslider = 5502;
_inslevel = 5512;
_securecheck = _display displayCtrl 5503;
_hookcheck = _display displayCtrl 5504;
_gpscheck = _display displayCtrl 5505;

sliderSetRange [_trunkslider, 0, 4];
sliderSetRange [_insslider, 0, 3];

sliderSetSpeed [_trunkslider, 1, 1];
sliderSetSpeed [_insslider, 1, 1];

sliderSetPosition[_trunkslider, (_vehicle getVariable["trunklevel", 0])];
sliderSetPosition[_insslider, (_vehicle getVariable["insurance", 0])];

ctrlSetText[5512,format["%1",(_vehicle getVariable["insurance", 0])]];
ctrlSetText[5511,format["%1",(_vehicle getVariable["trunklevel", 0])]];



_securecheck cbSetChecked (_vehicle getVariable["security",false]);
_hookcheck cbSetChecked (_vehicle getVariable["hooks",false]);
_gpscheck cbSetChecked (_vehicle getVariable["gps",false]);

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