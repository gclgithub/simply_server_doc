echo start install nginx
@echo off
set dir=%~dp0
cd /D %dir%
cd %dir%
rem echo ^<service^>> service.xml
rem echo ^<id^>nginx^</id^> >>service.xml
rem echo ^<name^>nginx^</name^>  >>service.xml
rem echo ^<description^>nginx^</description^>  >>service.xml
rem echo ^<executable^>%dir%nginx.exe^</executable^> >>service.xml
rem echo ^<logpath^>%dir%^</logpath^> >>service.xml
rem echo ^<logmode^>roll^</logmode^> >>service.xml
rem echo ^<depend^>^</depend^>  >>service.xml
rem echo ^<startargument^>-p %dir%^</startargument^>  >>service.xml
rem echo ^<stopargument^>-p %dir% -s stop^</stopargument^>  >>service.xml
rem echo ^</service^> >> service.xml
rem .\service.exe install
.\nssm.exe install nginx %dir%nginx.exe
.\nssm.exe start nginx
netsh advfirewall firewall add rule name="nginx" dir=in action=allow program="%dir%nginx.exe" enable=yes
schtasks /create /tn "reflesh nginx log" /tr "%~dp0logs\reflesh_access_log.bat" /sc weekly /mo 1 /ru "system"