sleep 1;
SAH_offers = [];
while {true} do
{
	sleep 5;
	_players = [];
	{
		if (isPlayer _x) then {
			_players pushBack [_x,getPlayerUID _x];
		};
	} forEach playableUnits;
	{
		_isOn = false;
		_curOffer = _x;
		{
			if ((_x select 1) == (_curOffer select 0)) then {_isOn = true;};
		} forEach _players;
		if (!_isOn) then {SAH_offers = SAH_offers - _curOffer;};
	} forEach SAH_offers;
};