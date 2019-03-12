::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFClVQBSKfEe/C7QV+u3H3+OEtlgPUfEDcYzU1KfWbeMf5VDgc5osxH8Xzp9CBRhXHg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFClVQBSKfEe/C7QV+u3Hy++UqVkSRN4cdIDO3rKCIfIWpED8cPY=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
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
set /p ding= Welke interface wil je gebruiken?(Type volledige naam): 
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
set /p ding= Welke interface wil je resetten?(type volledige naam): 
echo .
echo Ipv4 instellingen resetten
netsh int ipv4 set dnsservers "%ding%" source=dhcp
echo IPv6 instellingen resetten
netsh int ipv6 set dnsservers "%ding%" source=dhcp
goto end

:doei
cls
echo. 
echo Oke, houdoe.
echo.
pause
goto end
:end
ipconfig /flushdns
echo Houdoe

