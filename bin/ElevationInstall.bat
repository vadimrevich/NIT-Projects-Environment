rem Install Elevation Plugin
if not exist Distrib\ElevationSetupRepack.exe goto pass_Elevation
echo "Install Elevation..."
Distrib\ElevationSetupRepack.exe /VERYSILENT /NOCANCEL 
:pass_Elevation

