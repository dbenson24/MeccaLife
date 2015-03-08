/*/////////////////////////////////////////|//////////
//_______________________////////////////__|__////////
/|Made for ZoXXen.com    |/////////////____|____//////
/|Author:GamerDF         |///////////______|______////
/|Description: too lazy  |/////////////____|____//////
/|_______________________|///////////////  |  ////////
*////////////////////////////////////////~~|~~////////

if(isNull (findDisplay 6800)) then
{
	if(!createDialog "SettingsMenu") exitWith
	{
		hint "Something went wrong, the menu won't open?";
	};
};

disableSerialization;

ctrlSetText[68181, format["%1", zoXXen_foot]];
ctrlSetText[68191, format["%1", zoXXen_car]];
ctrlSetText[68201, format["%1", zoXXen_air]];

//Setup Sliders range
{
	slidersetRange [_x,80,4000];
} foreach [6818,6819,6820];

//Setup Sliders speed
{ 
	((findDisplay 6800) displayCtrl _x) sliderSetSpeed [100,100,100]; 
} foreach [6818,6819,6820];

//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[6818,zoXXen_foot],[6819,zoXXen_car],[6820,zoXXen_air]];

private["_display","_tags","_objs"];
_display = findDisplay 6800;
_tags = _display displayCtrl 6812;
_objs = _display displayCtrl 6826;

if(isNil "life_tagson") then {
	life_tagson = true;
	life_revealObjects = true;
};

if(life_tagson) then 
{
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText "Aktiv";
	_tags buttonSetAction "[LIFE_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; life_tagson = false; [] call life_fnc_settingsMenu;";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText "Inaktiv";
	_tags buttonSetAction "LIFE_ID_PlayerTags = [""LIFE_PlayerTags"",""onEachFrame"",""life_fnc_playerTags""] call BIS_fnc_addStackedEventHandler; life_tagson = true; [] call life_fnc_settingsMenu;";
};

if(life_revealObjects) then 
{
	_objs ctrlSetTextColor [0,1,0,1];
	_objs ctrlSetText "Aktiv";
	_objs buttonSetAction "[LIFE_ID_RevealObjects,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; life_revealObjects = false; [] call life_fnc_settingsMenu;";
} else {
	_objs ctrlSetTextColor [1,0,0,1];
	_objs ctrlSetText "Inaktiv";
	_objs buttonSetAction "LIFE_ID_RevealObjects = [""LIFE_RevealObjects"",""onEachFrame"",""life_fnc_revealObjects""] call BIS_fnc_addStackedEventHandler; life_revealObjects = true; [] call life_fnc_settingsMenu;";
};