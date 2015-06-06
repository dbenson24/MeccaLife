_h = [0,3];
_c = 100;
_rA = 2;

_r = floor(random 100)+1;
if (_r>_c) exitWith {};

_hMin = (_h select 0)*3600;
_hMax = (_h select 1)*3600;
_toWait = _hMin + floor(random (_hMax - _hMin));
//_w = floor(random _rA);

sleep _toWait;

switch (_w) do {
	case 0:
	{
		[] spawn TON_fnc_initConvoy1;
	};
	case 1:
//	{
//		[] spawn TON_fnc_initConvoy3;
//	};
//	case 1:
//	{
//		[] spawn TON_fnc_initConvoy2;
//	};
};