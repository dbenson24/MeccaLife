disableSerialization;
createDialog "lawMenu";
_display = findDisplay 50100;
_listbox = _display displayCtrl 50101;
_button = _display displayCtrl 50102;

life_laws = [];
[[player],"TON_fnc_getLaws",false,false] spawn life_fnc_mp;
waitUntil {count life_laws > 0};

{
	_listbox lbAdd _x;
	_listbox lbSetData [(lbSize _listbox)-1,_x];
} forEach life_laws;

if (life_isGov) then {_button ctrlSetText "Remove selected Law";};