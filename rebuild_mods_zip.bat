@echo off
setlocal

set "ROOT=%~dp0"
set "MODS_DIR=%ROOT%Mods"
set "ZIP_FILE=%ROOT%Mods.zip"

if not exist "%MODS_DIR%\" (
    echo Mods folder not found: "%MODS_DIR%"
    exit /b 1
)

if exist "%ZIP_FILE%" (
    del /f /q "%ZIP_FILE%"
)

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "Compress-Archive -Path '%MODS_DIR%' -DestinationPath '%ZIP_FILE%' -Force"

if errorlevel 1 (
    echo Failed to rebuild Mods.zip
    exit /b 1
)

echo Rebuilt "%ZIP_FILE%"
