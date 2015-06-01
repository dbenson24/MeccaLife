disableSerialization;
createDialog "govMenu";
_display = findDisplay 50200;
_text = _display displayCtrl 50203;
life_govCash = -1;
[[player],"TON_fnc_getGovCash",false,false] spawn life_fnc_mp;
waitUntil {life_govCash != -1};
_text ctrlSetText format ["%1 Dollar",[life_govCash] call life_fnc_numberText];