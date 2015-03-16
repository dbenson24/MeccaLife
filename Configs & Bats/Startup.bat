@echo off

REM taskkill /f /fi "status eq not responding" /im arma3server.exe
taskkill /f /im arma3server.exe
taskkill /im Bec.exe

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