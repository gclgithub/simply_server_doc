set dir=%~dp0
cd /D %dir%
cd %dir%
.\nssm.exe stop nginx
.\nssm.exe remove nginx confirm
schtasks /delete /tn "reflesh nginx log" /f