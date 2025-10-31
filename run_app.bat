@echo off
echo Social Impact MVP - Launcher
echo ===========================
echo.
echo 1. Run on Windows
echo 2. Run on Web (Chrome)
echo 3. Run Web Simplified Version
echo 4. Run Mobile Simplified Version
echo 5. Exit
echo.
set /p choice=Enter your choice (1-5): 

if "%choice%"=="1" (
    echo Running on Windows...
    flutter run -d windows
) else if "%choice%"=="2" (
    echo Running on Web (Chrome)...
    flutter run -d chrome --web-renderer html
) else if "%choice%"=="3" (
    echo Running Web Simplified Version...
    flutter run -d chrome --web-renderer html lib/main_web.dart
) else if "%choice%"=="4" (
    echo Running Mobile Simplified Version...
    flutter run lib/main_simplified.dart
) else if "%choice%"=="5" (
    echo Exiting...
    exit
) else (
    echo Invalid choice!
    pause
)
