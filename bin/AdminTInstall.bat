rem Install AdminT Plugin
if not exist Distrib\AdminTExponentaPluginSetup.exe goto pass_AdminT
echo "Install AdminT Plugin..."
Distrib\AdminTExponentaPluginSetup.exe /VERYSILENT /NOCANCEL 
:pass_AdminT

