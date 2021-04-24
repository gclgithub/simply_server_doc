@echo off
set dir=%~dp0
cd /D %dir%Redis
cd %dir%Redis
redis-server.exe --service-install redis.windows-service.conf --loglevel verbose
redis-server.exe --service-start