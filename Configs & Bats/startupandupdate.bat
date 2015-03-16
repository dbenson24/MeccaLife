@echo off

taskkill /f /fi "status eq not responding" /im arma3server.exe
taskkill /f /im arma3server.exe
taskkill /im Bec.exe
timeout 6
if exist C:\Users\Administrator\Desktop\update (
	echo update folder present
	cd C:\Users\Administrator\Desktop\update
	if exist Altis_Life.Altis (
		echo Altis_Life.Altis folder is being updated
		rd /q /s C:\arma3server\mpmissions\Altis_Life.Altis
		move Altis_Life.Altis C:\arma3server\mpmissions
	)
	if exist life_server.pbo (
		rd /q /s life_server
		echo life_server.pbo is being updated
		move life_server.pbo C:\arma3server\@life_server\addons\life_server.pbo
	)
	if exist @extDB (
		echo extDB is being updated
		move @extDB\extdb\db_custom\altis-life-rpg-4.ini C:\arma3server\@extDB\extDB\db_custom
		rd /q /s @extDB
	)
)
timeout 9
cd E:\arma3server\
start arma3server.exe "-config=E:\_arma3serverData\serverConfig.cfg" "-cfg=E:\_arma3serverData\server_network.cfg" "-BEPath=E:\_arma3serverData\battleye" "-profiles=E:\_arma3serverData\profiles" "-mod=@life_server;@extDB" "-enableHT"
echo ARMA 3 Server has started.

timeout 10
set becpath="E:\_arma3serverData\Bec"
cd /d %becpath%
start "" /min "Bec.exe" -f Config.cfg
timeout 3
echo Battleye has started.. 
echo Exiting.
timeout 3
exit