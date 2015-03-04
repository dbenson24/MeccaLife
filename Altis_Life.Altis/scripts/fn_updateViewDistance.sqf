/*
	file: fn_updateViewDistance.sqf
*/

switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {setViewDistance mecca_foot};
	case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance mecca_car};
	case ((vehicle player) isKindOf "Air"): {setViewDistance mecca_air};
};