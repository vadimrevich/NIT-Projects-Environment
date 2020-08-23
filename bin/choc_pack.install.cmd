@echo off
rem This file installs packets from the Chocolatey Packet Manager for Windows

set Chocolatey=%ALLUSERSPROFILE%\chocolatey

rem Check if Chocolatey is Installed
if not exist %Chocolatey% goto ch_not_installed
echo "Install Chocolatey Packets..."
%Chocolatey%\bin\choco.exe install -y --force --ignore-checksums sysinternals
rem %Chocolatey%\bin\choco.exe install -y --force --ignore-checksums duck
%Chocolatey%\bin\choco.exe install -y --force --ignore-checksums 7Zip.install
%Chocolatey%\bin\choco.exe install -y --force --ignore-checksums 7zip
%Chocolatey%\bin\choco.exe install -y --force --ignore-checksums 7zip.portable
%Chocolatey%\bin\choco.exe install -y --force --ignore-checksums unxutils
%Chocolatey%\bin\choco.exe install -y --force --ignore-checksums curl
%Chocolatey%\bin\choco.exe install -y --force --ignore-checksums wget
rem
%Chocolatey%\bin\RefreshEnv.cmd
echo "Success! Chocolatey Packets have been installed."
goto Finish

:ch_not_installed
echo Error: Chocolatey Packet Manager is not installed
echo Chocolatey's packets can't be installed
goto Finish

:Finish
