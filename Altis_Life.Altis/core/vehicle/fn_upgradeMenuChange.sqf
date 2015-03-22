private["_mode","_price","_ins","_trunk","_button"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_button = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0: //ground
	{
	    _ins = round(sliderPosition 5502);
		ctrlSetText[5512,format["%1",round(_ins)]];
		_trunk = round(sliderPosition 5501);
		ctrlSetText[5511,format["%1",round(_trunk)]];
		switch (_button) do
		{
		    case 0:
		    {
		        security = !security;
		        if (security) then {
		            ctrlSetText[5503,"On"];
		        } else {
		            ctrlSetText[5503,"Off"];
		        };
		    };
		    case 1:
		    {
		        hooks = !hooks;
		        if (hooks) then {
		            ctrlSetText[5504,"On"];
		        } else {
		            ctrlSetText[5504,"Off"];
		        };
		    };
		    case 2:
		    {
		        gps = !gps;
		        if (gps) then {
		            ctrlSetText[5505,"On"];
		        } else {
		            ctrlSetText[5505,"Off"];
		        };
		    };
		};
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


