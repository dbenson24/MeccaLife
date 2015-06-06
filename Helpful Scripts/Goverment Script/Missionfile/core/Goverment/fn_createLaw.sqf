disableSerialization;
_display = findDisplay 50200;
_textEdit = _display displayCtrl 50201;

_text = ctrlText _textEdit;

if (_text=="") exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>INVALID INPUT</t>";};

_text = format ["The Governor has adopted a new law: %1",_text];

[[1,_text], "life_fnc_broadcast", true, false] spawn life_fnc_mp;
[[_text], "TON_fnc_newLaw", false, false] spawn life_fnc_mp;