/*
		fn_federalUpdate.sqf
*/
private["_goldB"];
while {true} do
{
	sleep (30 * 270);
	_goldB = heli_safe getVariable["cargo",0];
	heli_safe setVariable["cargo",round(_goldB+round(random 100)),true]; //Adds a random number of cargo ever hour or 2 hours.
};