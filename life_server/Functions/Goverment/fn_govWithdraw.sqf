_cash = _this select 0;
diag_log "Amount of Gov Cash changed";
_query = format["UPDATE goverment SET laws='%1' WHERE id='3'",[_cash] call DB_fnc_numberSafe];
[_query,1] call DB_fnc_asyncCall;
[[0,format ["%1 have been withdrawn from the Goverments bank account",_cash]], "TON_fnc_broadcast",true,false] spawn life_fnc_mp;
