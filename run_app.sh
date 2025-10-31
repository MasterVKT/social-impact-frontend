#!/bin/bash

echo "Social Impact MVP - Launcher"
echo "==========================="
echo
echo "1. Run on Windows"
echo "2. Run on Web (Chrome)"
echo "3. Run Web Simplified Version"
echo "4. Run Mobile Simplified Version"
echo "5. Exit"
echo

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        echo "Running on Windows..."
        flutter run -d windows
        ;;
    2)
        echo "Running on Web (Chrome)..."
        flutter run -d chrome --web-renderer html
        ;;
    3)
        echo "Running Web Simplified Version..."
        flutter run -d chrome --web-renderer html lib/main_web.dart
        ;;
    4)
        echo "Running Mobile Simplified Version..."
        flutter run lib/main_simplified.dart
        ;;
    5)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice!"
        read -p "Press Enter to continue..."
        ;;
esac
