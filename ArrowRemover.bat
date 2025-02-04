@echo off
color 0A
title Acceso Directo Flecha KILLER

:: Verifica permisos de administrador
whoami /groups | find "S-1-5-32-544" >nul || (
    echo [ERROR] Este script requiere permisos de administrador.
    pause
    exit /b
)
echo ============================================
echo          CONFIGURACION DE REGISTRO
echo                  zspunky_rip
echo ============================================
echo.
echo [1/4] Buscando ubicacion del registro...
echo.
timeout /t 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /f
if %errorlevel% neq 0 (
    echo [ERROR] No se pudo crear la clave de registro.
    pause
    exit /b
)
echo [2/4] Agregando el valor 29...
timeout /t 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /t REG_SZ /d "%windir%\\System32\\shell32.dll,-50<" /f
if %errorlevel% neq 0 (
    echo [ERROR] No se pudo agregar el valor al registro.
    pause
    exit /b
)

echo [3/4] Reiniciando el Explorador de Windows...
timeout /t 1
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2
start explorer.exe
if %errorlevel% neq 0 (
    echo [ERROR] No se pudo reiniciar el Explorador de Windows.
    pause
    exit /b
)
echo [4/4] Borrando el contenido del valor 29...
timeout /t 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /t REG_SZ /d "" /f
if %errorlevel% neq 0 (
    echo [ERROR] Oops no pude borrar la informacion del valor 29.
    pause
    exit /b
)
echo.
echo ============================================
echo                OPERACION COMPLETA
echo               HECHO POR zspunky_rip
echo ============================================
start https://discord.gg/BmdcmT2quH
@echo Hola, gracias por usar el Script de zspunky_rip, todo esta configurado, ya no te preocupes por las molestas flechas, sigueme en mi canal de YT!, ah si y recuerda recomendarme con tus amigos o algo XD > "%temp%\zspunky_rip.txt"
start notepad "%temp%\zspunky_rip.txt"
pause

