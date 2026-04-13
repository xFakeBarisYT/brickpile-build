@echo off
setlocal enabledelayedexpansion

set PROJECT_PATH="%~dp0plugModules\plugin.csproj"
set OUTPUT=UserScripts\UI.dll
set RESOURCE_FILES=

for /R "UserLibrary" %%F in (*) do (
    set RESOURCE_FILES=!RESOURCE_FILES! /resource:"%%F"
)

dotnet build %PROJECT_PATH% --configuration Debug

if %errorlevel% neq 0 (
    echo Compilation failed.
    pause
    exit /b %errorlevel%
)

copy "%~dp0plugModules\bin\Debug\net8.0\plugin.dll" %OUTPUT%

if %errorlevel% neq 0 (
    echo Failed to copy output DLL.
    pause
    exit /b %errorlevel%
)

echo Compilation successful: %OUTPUT%
pause