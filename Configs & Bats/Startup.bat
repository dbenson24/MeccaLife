@echo off

REM taskkill /f /fi "status eq not responding" /im arma3server.exe
taskkill /f /im arma3server.exe
taskkill /im Bec.exe
timeout 6

timeout 3
cd C:\arma3server\
start arma3server.exe "-config=D:\arma3configs\serverconfig.cfg" "-cfg=D:\arma3configs\server_network.cfg" "-BEPath=D:\arma3configs\BE" "-profiles=C:\ArmA3Data" "-mod=@life_server;@extDB"
timeout 6
echo ARMA 3 Server has started.

timeout 10
set becpath="D:\arma3configs\Bec"
cd /d %becpath%
start "" /min "Bec.exe" -f Config.cfg
timeout 3
echo Battleye has started.. 
echo Exiting.
exit