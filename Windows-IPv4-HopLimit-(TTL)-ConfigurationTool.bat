@echo off
cls
echo.
echo                     [     Specially Prepared by Thomas F.C.     ]
echo.
echo.
echo                     =============================================
echo                           IPv4 Hop Limit (TTL) Checks
echo                     =============================================

REM Query the current hop limit for IPv4
netsh int ipv4 show global | findstr /C:"Default Hop Limit"

echo.
echo.
echo.
echo                     =============================================
echo                           Select TTL Value for IPv4
echo                     =============================================
echo                         [1] Set TTL to 128 (Default Setting)
echo                         [2] Set TTL to 65  (Hotspot Bypass)
echo                         [3] Set TTL to 64  (Hotspot Bypass 2)
echo                         [4] Exit
echo                     =============================================
echo.

<nul set /p=                    Enter your choice (1-4):  
set /p choice=

echo.
echo                     Processing, please wait...
echo.

if "%choice%"=="1" (
    netsh int ipv4 set glob defaultcurhoplimit=128
    echo                     TTL set to 128
) else if "%choice%"=="2" (
    netsh int ipv4 set glob defaultcurhoplimit=65
    echo                     TTL set to 65
) else if "%choice%"=="3" (
    netsh int ipv4 set glob defaultcurhoplimit=64
    echo                     TTL set to 64
) else if "%choice%"=="4" (
    echo                     Exiting...
    exit
) else (
    echo                     Invalid choice! Please run the script again.
    exit
)

echo.
<nul set /p=                    Press any key to continue...
pause >nul
