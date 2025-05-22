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
echo ^|     - screen size: 1080x2400      ^|
echo ^|     - screen density: 440         ^|
echo ^|  2. Connect to Default Device     ^|
echo ^|  3. Set font size                 ^|
echo ^|  4. Set custom screen size        ^|
echo ^|  5. Set custom screen density     ^|
echo ^|  6. Reset display                 ^|
echo ^|  0. Exit                          ^|
echo *-----------------------------------*
echo.
set /p choice="Choice: "

if "%choice%"=="1" (
    goto DEFAULT
) else if "%choice%"=="2" (
    goto CONNECT
) else if "%choice%"=="3" (
    goto FONT_SIZE
) else if "%choice%"=="4" (
    goto CUSTOM_SCREEN_SIZE
) else if "%choice%"=="5" (
    goto CUSTOM_DENSITY
) else if "%choice%"=="6" (
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

:FONT_SIZE
echo *-----------------------------------*
echo ^|  Screen Size Options              ^|
echo *-----------------------------------*
echo ^|  1. Small: 0.85                   ^|
echo ^|  2. Default: 1.0                  ^|
echo ^|  3. Large: 1.15                   ^|
echo ^|  4. Largest: 1.3                  ^|
echo ^|  5. Extra: 2.0                     ^|
echo *-----------------------------------*
echo.
set /p option="Select Size: "

if "%option%"=="1" (
    set font_size=0.85
) else if "%option%"=="2" (
    set font_size=1.0
) else if "%option%"=="3" (
    set font_size=1.15
) else if "%option%"=="4" (
    set font_size=1.3
) else if "%option%"=="5" (
    set font_size=2.0
) else (
    echo Invalid option. Using default size 1.0
    set font_size=1.0
)

adb shell settings put system font_scale %font_size%
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

