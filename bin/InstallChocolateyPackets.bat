rem Install Chocolatey Packet
if exist %Chocolatey% goto pass_Chocolatey
if not exist chock.install.cmd goto pass_Chocolatey
echo "Install Chocolatey..."
call chock.install.cmd
:pass_Chocolatey

rem Install Chocolatey's Packet
if not exist choc_pack.install.cmd goto pass_ChocPack
echo "Install Chocolatey's Packets..."
call choc_pack.install.cmd
:pass_ChocPack

