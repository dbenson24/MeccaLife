disableSerialization;
if (!life_canVote) exitWith {};
createDialog "voteMenu";
_display = findDisplay 50000;
_listbox = _display displayCtrl 50001;
{
	if (isPlayer _x) then {
		_listbox lbAdd (name _x);
		_listbox lbSetData [(lbSize _listbox )-1,format ["%1",_x]]
	};
} forEach playableUnits;