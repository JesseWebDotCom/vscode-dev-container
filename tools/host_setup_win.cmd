@echo off

for %%I in ("%~dp0.") do for %%J in ("%%~dpI.") do set PROJECT_DIR=%%~dpnxJ

echo Installing the terminal window fonts...
SET FONTS_DIR=%LOCALAPPDATA%\Microsoft\Windows\Fonts

@REM # download and install the terminal font
@REM # - font download links - https://www.nerdfonts.com/font-downloads
curl -o "%LOCALAPPDATA%\Temp\meslo.zip" -LO "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
tar -xvzf "%LOCALAPPDATA%\Temp\meslo.zip" -C "%FONTS_DIR%"
del /f "%LOCALAPPDATA%\Temp\meslo.zip"

echo Installing the console window fonts...
curl -o "%LOCALAPPDATA%\Temp\fira.zip" -LO https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
mkdir "%LOCALAPPDATA%\Temp\fira"
tar -xvzf "%LOCALAPPDATA%\Temp\fira.zip" -C "%LOCALAPPDATA%\Temp\fira"
copy %LOCALAPPDATA%\Temp\fira\ttf\* "%FONTS_DIR%"
del /f %LOCALAPPDATA%\Temp\fira.zip
rmdir /s /q "%LOCALAPPDATA%\Temp\fira"

echo Registering fonts
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Fira Code Light (TrueType)" /t REG_SZ /d "%FONTS_DIR%\FiraCode-Light.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Fira Code Medium (TrueType)" /t REG_SZ /d "%FONTS_DIR%\FiraCode-Medium.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Fira Code Regular (TrueType)" /t REG_SZ /d "%FONTS_DIR%\FiraCode-Regular.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Fira Code Retina (TrueType)" /t REG_SZ /d "%FONTS_DIR%\FiraCode-Retina.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Fira Code SemiBold (TrueType)" /t REG_SZ /d "%FONTS_DIR%\FiraCode-SemiBold.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Bold Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Bold Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Bold Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Bold Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Bold Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Bold Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Bold Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Bold Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Bold Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Bold Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Bold Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Bold Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Bold Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Bold Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Bold Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Bold Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Bold Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Bold Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Bold Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Bold Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Bold Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Bold Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Bold Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Bold Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Bold Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Bold Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Bold Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Bold Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Bold Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Bold Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Bold Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Bold Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Regular Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Regular Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Regular Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Regular Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Regular Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Regular Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L DZ Regular Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L DZ Regular Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Regular Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Regular Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Regular Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Regular Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Regular Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Regular Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG L Regular Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG L Regular Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Bold Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Bold Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Bold Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Bold Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Bold Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Bold Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Bold Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Bold Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Bold Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Bold Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Bold Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Bold Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Bold Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Bold Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Bold Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Bold Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Bold Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Bold Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Bold Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Bold Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Bold Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Bold Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Bold Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Bold Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Bold Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Bold Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Bold Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Bold Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Bold Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Bold Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Bold Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Bold Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Regular Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Regular Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Regular Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Regular Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Regular Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Regular Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M DZ Regular Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M DZ Regular Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Regular Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Regular Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Regular Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Regular Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Regular Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Regular Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG M Regular Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG M Regular Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Bold Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Bold Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Bold Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Bold Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Bold Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Bold Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Bold Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Bold Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Bold Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Bold Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Bold Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Bold Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Bold Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Bold Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Bold Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Bold Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Bold Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Bold Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Bold Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Bold Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Bold Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Bold Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Bold Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Bold Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Bold Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Bold Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Bold Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Bold Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Bold Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Bold Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Bold Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Bold Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Regular Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Regular Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Regular Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Regular Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Regular Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Regular Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S DZ Regular Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S DZ Regular Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Italic Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Italic Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Italic Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Italic Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Italic Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Italic Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Italic Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Italic Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Regular Nerd Font Complete Mono Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Regular Nerd Font Complete Mono Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Regular Nerd Font Complete Mono (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Regular Nerd Font Complete Mono.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Regular Nerd Font Complete Windows Compatible (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Regular Nerd Font Complete Windows Compatible.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Meslo LG S Regular Nerd Font Complete (TrueType)" /t REG_SZ /d "%FONTS_DIR%\Meslo LG S Regular Nerd Font Complete.ttf" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Fira Code Bold (TrueType)" /t REG_SZ /d "%FONTS_DIR%\FiraCode-Bold.ttf" /f

echo Verifying customizations...
@REM # create customization files if not present (these are for your customziation and are intentionally gitignored)
if not exist "%PROJECT_DIR%\.devcontainer\customize\." mkdir "%PROJECT_DIR%\.devcontainer\customize"
if not exist "%PROJECT_DIR%\.devcontainer\customize\setup_container.sh" copy NUL "%PROJECT_DIR%\.devcontainer\customize\setup_container.sh"
if not exist "%PROJECT_DIR%\.devcontainer\customize\variables.env" copy NUL "%PROJECT_DIR%\.devcontainer\customize\variables.env"

echo Finished
