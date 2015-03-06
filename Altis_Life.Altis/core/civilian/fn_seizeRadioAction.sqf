/*
	fn_seizeRadioAction.sqf
*/


player unassignItem "ItemRadio";
player removeItem "ItemRadio";

[] call life_fnc_civFetchGear;
[] call SOCK_fnc_updateRequest;
[] call life_fnc_civLoadGear;
titleText["Your radio has been seized.","PLAIN"];