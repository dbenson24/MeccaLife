disableSerialization;
_display = findDisplay 50200;
_textEdit = _display displayCtrl 50204;

_text = ctrlText _textEdit;
_number = parseNumber _text;

if (_number>life_govCash) exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>Not enough cash</t>";};
life_atmcash = life_atmcash + _number;
closeDialog 0;
_amount = life_govCash - _number;
[[_amount], "TON_fnc_govWithdraw", false, false] spawn life_fnc_mp;
[[0,format ["%1 have been withdrawn from the Goverments bank account",_number]], "life_fnc_broadcast",true,false] spawn life_fnc_mp;
createDialog "govActionMenu";
