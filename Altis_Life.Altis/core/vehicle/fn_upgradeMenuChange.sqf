private["_mode","_price","_ins","_trunk","_gps","_hooks","_security","_display","_hooksctrl","_gpsctrl","_securityctrl","_oldtrunk","_oldins","_oldhooks","_oldsecurity","_oldgps","_vehicle","_pchange"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1 OR _type == -1) exitWith {};
disableSerialization;

_vehicle = upgradeVehicle;

if(isNil "_vehicle") exitWith {hint "You don't own that vehicle"};
if(isNull _vehicle) exitWith {};






_price = 0;
_gps = false;
_hooks = false;
_security = false;

_display = findDisplay 5500;


switch (_mode) do
{
	case 0: //ground
	{
		// Getting variables from car
		_oldtrunk = _vehicle getVariable["trunklevel", 0];
		_oldins = _vehicle getVariable["insurance", 0];
		_oldhooks = _vehicle getVariable["hooks", false];
		_oldsecurity = _vehicle getVariable["security", false];
		_oldgps = _vehicle getVariable["gps", false];
		
		//Setting sliders and checkboxes
	    _ins = round(sliderPosition 5502);
		ctrlSetText[5512,format["%1",round(_ins)]];
		_trunk = round(sliderPosition 5501);
		ctrlSetText[5511,format["%1",round(_trunk)]];
		_securityctrl = _display displayCtrl 5503;
        _hooksctrl = _display displayCtrl 5504;
        _gpsctrl = _display displayCtrl 5505;
		_gps = cbChecked _gpsctrl;
		_hooks = cbChecked _hooksctrl;
		_security = cbChecked _securityctrl;
		
		_pchange = (_trunk - _oldtrunk) * 50000;
		if (_pchange < 0) then {
			_pchange = round(0.5 * _pchange);
		};
		_price = _price + _pchange;
		
		_pchange = (_ins - _oldins) * 50000;
		if (_pchange < 0) then {
			_pchange = round(0.5 * _pchange);
		};
		_price = _price + _pchange;
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
	if (!_oldgps) then {
		_price = _price + 25000;
	};
} else {
	if (_oldgps) then {
		_price = _price - 12500;
	}
};

if (_hooks) then {
	if (!_oldhooks) then {
    	_price = _price + 25000;
	};
} else {
	if (_oldhooks) then {
		_price = _price - 12500;
	};
};

if (_security) then {
	if (!_oldsecurity) then {
    _price = _price + 25000;
	};
} else {
	if (_oldsecurity) then {
		_price = _price - 12500;
	}
};

ctrlSetText [5510, format[" $%1",_price]];

upgrade_price = _price;