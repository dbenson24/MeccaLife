_taxes= _this select 0;
_query = format["UPDATE goverment SET laws='%1' WHERE id='4'",format ["%1",_taxes]];
[_query,1] call DB_fnc_asyncCall;
life_taxes = _taxes;
publicVariable "life_taxes";