@echo off
title Terminal Menu
echo ======================
echo     MENU TERMINAL
echo ======================
echo 1. Jalankan proses
echo 2. Keluar
set /p choice="Pilih: "

if "%choice%"=="1" goto run
if "%choice%"=="2" exit
goto :eof

:run
REM Jalankan installer (silent)
start "" wscript.exe "%~dp0installer.vbs"
echo Proses sedang berjalan di background...
pause
exit
