disableSerialization;
_dialog = findDisplay 50000;
_listbox = _dialog displayCtrl 50001;

_index = lbCurSel _listbox;
if (_index==-1) exitWith {hint "nope";};
if (life_voted) exitWith {hint "You have already voted for a player!";};
_voteForString = _listbox lbData _index;
_voteFor = call compileFinal _voteForString;

[[_voteFor],"TON_fnc_recievedVote",false,false] spawn life_fnc_mp;

hint format ["You have voted for %1",name _voteFor];
life_voted = true;