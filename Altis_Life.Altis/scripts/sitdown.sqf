_chair = _this select 0; 
_unit = _this select 1;
if(player distance _unit > 5) exitWith {hint "You need to be within 5 feet!"}; 
life_action_sit = false; //Stops the Bug loop
[[_unit, "Crew"], "MAC_fnc_switchMove"] spawn BIS_fnc_MP; 
_unit setPos (getPos _chair); 
_unit setDir ((getDir _chair) - 180); 
standup = _unit addaction ["<t color='#0099FF'>Stand Up</t>","scripts\standup.sqf"];
_unit setpos [getpos _unit select 0, getpos _unit select 1,((getpos _unit select 2) +1)];