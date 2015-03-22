private["_mode","_price","_ins","_trunk"];
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1 OR _type == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0: //ground
	{
	    _ins = round(sliderPosition 5502);
		ctrlSetText[5512,format["%1",round(_ins)]];
		_trunk = round(slidePosition 5501);
		ctrlSetText[5511,format["%1",round(_trunk)]];
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


