_voteFor = _this select 0;
if (isNil "votes") then {votes = [];};

_atIndex = -1;
_wasInArray = false;
_votes = 0;
{
	if (!_wasInArray) then {_atIndex = _atIndex + 1;};
	if (_x select 0 == _voteFor) then {_wasInArray=true;_votes = _x select 1;}
} forEach votes;

if (_wasInArray) then {
	votes set [_atIndex,[_voteFor,_votes+1]];
} else {
	votes pushBack [_voteFor,1];
};