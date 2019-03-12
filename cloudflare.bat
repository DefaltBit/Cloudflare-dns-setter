@ECHO off
cls
:start
echo.
echo.
color 09

echo    ________                __________              
echo   / ____/ /__dns-tool_____/ / ____/ /___ _________ 
echo  / /   / / __ \/ / / / __  / /_  / / __ `/ ___/ _ \
echo / /___/ / /_/ / /_/ / /_/ / __/ / / /_/ / /  /  __/
echo \____/_/\____/\__,_/\__,_/_/   /_/\__,_/_/   \___/                                                   
echo                                           by Ralph.
ECHO.
ECHO 1. Set CloudFlare DNS
ECHO 2. Set Default DNS
ECHO 3. Exit
set choice=
set /p choice= Make a choice: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto cloudflare
if '%choice%'=='2' goto two
if '%choice%'=='3' goto doei
ECHO "%choice%" is not valid, try again
ECHO.

:cloudflare
cls
netsh int show int
set ding=
set /p ding= Which interface do you want to use?(Type full name): 
set DNS1=1.1.1.1
set DNS2=1.0.0.1
set DNS3=2606:4700:4700::1111
set DNS4=2606:4700:4700::1001

echo Changing %ding% IPv4 : %DNS1%
netsh int ipv4 set dns name="%ding%" static %DNS1% primary validate=no
echo Changing %ding% IPv4: %DNS2%
netsh int ipv4 add dns name="%ding%" %DNS2% index=2 validate=no
echo Changing %ding% IPv6: %DNS3%
netsh interface ipv6 set dnsservers "%ding%" static 2606:4700:4700::1111 primary validate=no
echo Changing %ding% IPv6: %DNS4%
netsh interface ipv6 add dnsservers "%ding%" 2606:4700:4700::1001 index=2 validate=no
pause
goto end
:two
cls
netsh int show int
set ding=
set /p ding= Which interface would you like to put back to default?(type full name): 
echo .
echo Ipv4 instellingen resetten
netsh int ipv4 set dnsservers "%ding%" source=dhcp
echo IPv6 instellingen resetten
netsh int ipv6 set dnsservers "%ding%" source=dhcp
goto end

:doei
cls
echo. 
echo Ok bye.
echo.
pause
goto end
:end
ipconfig /flushdns

