_query = format["UPDATE goverment SET laws='%1' WHERE id='2'","00000000000000000000"];
[_query,1] call DB_fnc_asyncCall;

[[1,"The Governor has been killed! A new election will begin soon!"],"life_fnc_broadcast",true,false] spawn life_fnc_mp;

sleep 300;

[] spawn TON_fnc_newVote;