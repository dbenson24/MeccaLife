_mode = [_this, 0, -1] call BIS_fnc_param;
_info = [_this, 1, -1] call BIS_fnc_param;

switch (_mode) do {
	case 0:
	{
		sleep 5;
		hint "Congratulations! You are the new President! Relog to access all features.";
		profileNamespace setVariable ["isGov",true];
		life_isGov = true;
	};
	case 1:
	{
		hint "Successfully logged in as President";
		life_isGov = true;
	};
	case 2:
	{
		hint "You are no longer the President";
		life_isGov = false;
	};
	case 3:
	{
		if (count _info == 0) then {_info pushBack "There are currently no laws made by the president";};
		life_laws = _info;
	};
	case 4:
	{
		life_govCash = _info;
	};
};