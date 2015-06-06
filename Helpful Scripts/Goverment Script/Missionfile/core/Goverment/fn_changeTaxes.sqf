_display = findDisplay 50200;
_textEdit = _display displayCtrl 50202;

_text = ctrlText _textEdit;
_number = parseNumber _text;

if (_number>100) exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>Too high</t>";};
closeDialog 0;
[[_number], "TON_fnc_changeTaxes", false, false] spawn life_fnc_mp;