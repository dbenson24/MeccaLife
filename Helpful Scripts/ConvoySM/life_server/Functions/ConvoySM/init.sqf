/*
#####################   CONVOY SIDEMISSION  #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

ConvoySM_getIn = Compile PreprocessFile "\life_server\Functions\ConvoySM\getIn.sqf";
ConvoySM_maxSpeed = Compile PreprocessFile "\life_server\Functions\ConvoySM\maxSpeed.sqf";
ConvoySM_attack	= Compile PreprocessFile "\life_server\Functions\ConvoySM\attack.sqf";
ConvoySM_move = Compile PreprocessFile "\life_server\Functions\ConvoySM\move.sqf";
ConvoySM_restart = Compile PreprocessFile "\life_server\Functions\ConvoySM\restart.sqf";
[_this select 0,_this select 1,_this select 2] spawn ConvoySM_move;