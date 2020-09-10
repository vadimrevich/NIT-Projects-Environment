rem Install AdminScripts Plugin
if not exist Distrib\Scripts.Set01.msi goto pass_AdminScripts
echo "Uninstall AdminScripts Plugin..."
wmic product where name="AdminScripts Set 01" call uninstall
echo "Install AdminScripts Plugin..."
%SystemRoot%\system32\msiexec.exe /i Distrib\Scripts.Set01.msi /norestart /QN /L*V %TEMP%\Scripts.Set01.log
:pass_AdminScripts

