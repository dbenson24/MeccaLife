[[1,"A election for the new President begins, vote now! The election will end in 10 Minutes"],"life_fnc_broadcast",true,false] spawn life_fnc_mp;
life_canVote = true;
votes = [];
publicVariable "life_canVote";
sleep 20;
life_canVote = false;
publicVariable "life_canVote";
[] spawn TON_fnc_voteEnd;