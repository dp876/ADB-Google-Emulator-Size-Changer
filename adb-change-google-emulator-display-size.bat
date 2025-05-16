@echo off
set adb_path="C:\Program Files\Google\Play Games Developer Emulator\current\emulator"

cd %adb_path% 

if not exist adb.exe (
    echo ADB not found in the specified path.
    echo press any key to exit
    pause > nul
    exit
)

:MENU
echo.
echo *-----------------------------------*
echo ^|   Google Emulator Size Changer    ^|
echo ^|            by dvp876              ^|
echo *-----------------------------------*
echo ^|  1. Connect and Apply Defaults    ^|
echo ^|  2. Connect to Default Device     ^|
echo ^|  3. Set screen size to 1080x2400  ^|
echo ^|  4. Set screen density to 440     ^|
echo ^|  5. Set custom screen size        ^|
echo ^|  6. Set custom screen density     ^|
echo ^|  7. Reset display                 ^|
echo ^|  0. Exit                          ^|
echo *-----------------------------------*
echo.
set /p choice="Choice: "

if "%choice%"=="1" (
    goto DEFAULT
) else if "%choice%"=="2" (
    goto CONNECT
) else if "%choice%"=="3" (
    goto SCREEN_SIZE
) else if "%choice%"=="4" (
    goto DENSITY
) else if "%choice%"=="5" (
    goto CUSTOM_SCREEN_SIZE
) else if "%choice%"=="6" (
    goto CUSTOM_DENSITY
) else if "%choice%"=="7" (
    goto RESET
) else if "%choice%"=="0" (
    exit
) else (
    cls
    echo.
    echo Invalid choice, please try again.
    goto MENU
)


:DEFAULT
adb devices
adb get-state

echo setting screen size to 1080x2400
adb shell wm size 1080x2400

echo setting screen density to 440
adb shell wm density 440

pause
cls
goto MENU


:CONNECT
adb devices
adb get-state
pause
cls
goto MENU


:SCREEN_SIZE
adb shell wm size 1080x2400
pause
cls
goto MENU


:DENSITY
adb shell wm density 440
pause
cls
goto MENU


:CUSTOM_SCREEN_SIZE
set /p width="Enter screen width (e.g., 1080): "
set /p height="Enter screen height (e.g., 2400): "
adb shell wm size %width%x%height%
echo Screen size set to %width%x%height%
pause
cls
goto MENU


:CUSTOM_DENSITY
set /p density="Enter screen density (e.g., 440): "
adb shell wm density %density%  
echo Screen density set to %density%
pause
cls
goto MENU


:RESET
adb shell wm reset
pause
cls
goto MENU

