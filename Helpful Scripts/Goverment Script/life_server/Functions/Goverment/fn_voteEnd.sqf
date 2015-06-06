_winner = objNull;
_players = [];
_votes = [];
if (count votes == 0) exitWith {};
{
	_players pushBack (_x select 0);
	_votes pushBack (_x select 1);
} forEach votes;
_lowestIndex = 0;
_index = -1;
_highestVotes = 0;
{
	_index = _index + 1;
	if (_x > _highestVotes) then {_lowestIndex = _index;_highestVotes = _x;};
} forEach _votes;
_winner = _players select _lowestIndex;
_message = format ["Congratiulations! %1 won the election and is now the new President!",name _winner];
[[1,_message],"life_fnc_broadcast",true,false] spawn life_fnc_mp;
[[0],"life_fnc_recievedCall",_winner,false] spawn life_fnc_mp;

_query = format["UPDATE goverment SET laws='%1' WHERE id='2'",format ["%1",getPlayerUID _winner]];
[_query,1] call DB_fnc_asyncCall;