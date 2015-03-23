private["_mode","_price","_ins","_trunk","_gps","_hooks","_security","_display","_hooksctrl","_gpsctrl","_securityctrl"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1 OR _type == -1) exitWith {};
disableSerialization;

_price = 0;
_gps = false;
_hooks = false;
_security = false;

_display = findDisplay 5500;


switch (_mode) do
{
	case 0: //ground
	{
	    _ins = round(sliderPosition 5502);
		ctrlSetText[5512,format["%1",round(_ins)]];
		_trunk = round(sliderPosition 5501);
		ctrlSetText[5511,format["%1",round(_trunk)]];
		_securityctrl = _display displayCtrl 5503;
        _hookctrl = _display displayCtrl 5504;
        _gpsctrl = _display displayCtrl 5505;
		_price = _trunk * 50000;
		_price = _price + _ins * 50000;
		_gps = cbChecked _gpsctrl;
		_hooks = cbChecked _hooksctrl;
		_security = cbChecked _securityctrl;
	};

	case 1: //air
	{
		ctrlSetText[2912,format["%1",round(_value)]];
	};
	
	case 2: //water
	{
		ctrlSetText[2922,format["%1",round(_value)]];
	};
};

if (_gps) then {
    _price = _price + 25000;
};

if (_hooks) then {
    _price = _price + 25000;
};

if (_security) then {
    _price = _price + 25000;
};

