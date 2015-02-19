/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_vals","_delayInt"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 6)) exitWith {};
if ((vehicle player) != player) exitWith { hint "This action cannot be performed from within a vehicle." };
if (side player == west) exitWith {hint "You cannot preform this action as an officer."};

//unprocessed item,processed item, cost if no license,Text to display, 0 (I.e Processing  (percent) ..."
// Matt, always have the 0 at the end.

_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",1200,(localize "STR_Process_Oil")];};
	case "diamond": {["diamond_uncut","diamond_cut",1350,(localize "STR_Process_Diamond")];};
	case "heroin": {["heroin_unprocessed","heroin_processed",1750,(localize "STR_Process_Heroin")];};
	case "copper": {["copper_unrefined","copper_refined",750,(localize "STR_Process_Copper")];};
	case "iron": {["iron_unrefined","iron_refined",1120,(localize "STR_Process_Iron")];};
	case "sand": {["sand","glass",650,(localize "STR_Process_Sand")];};
	case "salt": {["salt_unrefined","salt_refined",450,(localize "STR_Process_Salt")];};
	case "cocaine": {["cocaine_unprocessed","cocaine_processed",1500,(localize "STR_Process_Cocaine")];};
	case "marijuana": {["cannabis","marijuana",500,(localize "STR_Process_Marijuana")];};
	case "cement": {["rock","cement",500,(localize "STR_Process_Cement")];};
	case "frog": {["frog","froglsd",500,(localize "STR_Process_Frog")];};
	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {hint "You don't have the items necessary"};

//Setup vars
_oldItem = [];
_vals = [];
{_oldItem = _oldItem + [_x];} foreach (_itemInfo select 0);
if(count _oldItem == 0) exitWith {hint "You don't have the items necessary"};
{_vals = _vals + [missionNamespace getVariable ([_x,0] call life_fnc_varHandle)];} foreach _oldItem;
_oldVal = _vals select 0;
{if (_x < _oldVal) then {_oldVal = _x};} foreach _vals;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

//edit this accordingly
if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};


_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
if(_oldVal == 0) exitWith {};
_cost = _cost * _oldVal;

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;
if((!_hasLicense)&&(CASH < _cost)) exitWith {
	hint format["You need $%1 to process without a license!",[_cost] call life_fnc_numberText];
	5 cutText ["","PLAIN"]; life_is_processing = false;
};

_delayInt = _oldVal * 0.03;
while{true} do {
	sleep _delayInt;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vendor > 10) exitWith {};
};
	
if(player distance _vendor > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
if((!_hasLicense)&&(CASH < _cost)) exitWith {hint format["You need $%1 to process without a license!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
if(!(alive player)) exitWith {hint "You need to be alive to process."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
//Removes the old items
{
	if(!([false,_x,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"]; life_is_processing = false;
	};
} foreach _oldItem;

//Adds the new item
if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {
	5 cutText ["","PLAIN"];
	{[true,_x,_oldVal] call life_fnc_handleInv;} foreach _oldItem;
	life_is_processing = false;
};

5 cutText ["","PLAIN"];

if (_hasLicense) then {
	titleText[format["You have processed your goods into %1",_itemName],"PLAIN"];
} else {
	titleText[format["You have processed your goods into %1 for $%2",_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	
	CASH = CASH - _cost;
};

life_is_processing = false;