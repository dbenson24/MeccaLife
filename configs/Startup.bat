@echo off

timeout 5
REM taskkill /f /fi "status eq not responding" /im arma3server.exe
taskkill /f /im arma3server.exe
taskkill /im Bec.exe

timeout 5
if exist E:\update (
	echo update folder present
	cd E:\update
	if exist Altis_Life.Altis (
		echo MAltis_Life.Altis folder is being updated
		ren Altis_Life.Altis MAltis_Life.Altis	
		rd /q /s E:\arma3server\MPMissions\MAltis_Life.Altis
		move MAltis_Life.Altis E:\arma3server\MPMissions
	)
	if exist life_server.pbo (
		rd /q /s life_server
		echo life_server.pbo is being updated
		move life_server.pbo E:\arma3server\@life_server\addons\life_server.pbo
	)
	if exist @extDB (
		echo extDB is being updated
		move @extDB\extdb\db_custom\altis-life-rpg-4.ini E:\arma3server\@extDB\extDB\db_custom
		rd /q /s @extDB
	)
)
timeout 1
cd E:\arma3server\
start arma3server.exe "-config=E:\_arma3serverData\configs\serverConfig.cfg" "-cfg=E:\_arma3serverData\configs\server_network.cfg" "-BEPath=E:\_arma3serverData\battleye" "-profiles=E:\_arma3serverData\Profiles" "-mod=@life_server;@extDB" "-enableHT"
echo ARMA 3 Server has started.

timeout 10
set becpath="E:\_arma3serverData\Bec"
cd /d %becpath%
start "" /min "Bec.exe" -f Config.cfg
echo Battleye has started.. 
echo Exiting.
timeout 3
exit