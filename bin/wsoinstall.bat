rem Install wso Interface Plugin
if not exist Distrib\wso.exe goto pass_wso
echo "Install WSO Plugin..."
Distrib\wso.exe /VERYSILENT /NORESTART 
:pass_wso

