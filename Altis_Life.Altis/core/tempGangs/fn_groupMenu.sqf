/*	
		File: fn_gangMenu.sqf
*/

if(!isNull life_my_gang) then
{	
	createDialog "MECCA_Life_My_Group_Diag";
}	
	else
{	
	createDialog "MECCA_Life_Gang_Prompt";
};