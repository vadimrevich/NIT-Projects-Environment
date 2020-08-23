@echo off

rem Install Hidden Start Plugin
if not exist Distrib\HiddenStartSetupRePack.exe goto pass_HiddenStart
echo "Install Hidden Start..."
Distrib\HiddenStartSetupRePack.exe /VERYSILENT /NOCANCEL

:pass_HiddenStart

