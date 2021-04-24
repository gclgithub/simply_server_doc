@echo off
set dir=%~dp0
cd /D %dir%Redis
cd %dir%Redis
redis-server.exe --service-stop
redis-server.exe --service-uninstall
