@echo off
rem �������������� ���������� ��������� �������

SetLocal EnableExtensions EnableDelayedExpansion

set curdirforurl=%CD%

rem ������� � ������ ����� ������� �� ���������� � ����� ��������������:
md "%curdirforurl%\Distrib"
%SystemRoot%\System32\attrib.exe +H "%curdirforurl%\Distrib"

rem ����������� ���������� ��������� ��� ������� Wget

rem ���������� ����������:

rem INI File For MainExponenta Installer

rem Installation Directory

set PUB1=c:\pub1
set AdminT=c:\Elevation
set ELEVATION=c:\Elevation
set UTIL=c:\Util

rem Main Installation Hosts

set Hacker_host1=dummy.mydomen.com
set httphost=dummy.mydomen.com
set ftphost=dummy.mydomen.com
set httpMainFolder=Exponenta
set httppref=http
set httpport=80
set httpuser=
set httppassword=
set ftpport=21
set ftpuser=u0597072_anonym
set ftppassword=MyAdminPassword
set ftpMainFolder=Exponenta
set ftpSubFolder=
set ftpSubFolder1=
set ftpFileMask=*

rem HTTP WebDAV Host
set host=%httppref%://%httphost%:%httpport%/%httpMainFolder%
rem ��������� �������
set LocalFolder=%curdirforurl%\Distrib
copy "%curdirforurl%\wget.exe" "%LocalFolder%\wget.exe"
cd "%LocalFolder%"

rem ��������� ��� ��������� ��� wget.exe � �����������
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=in action=allow program="%LocalFolder%\wget.exe" enable=yes
rem ��������� ��� ��������� ��� wget.exe � �����������
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=out action=allow program="%LocalFolder%\wget.exe" enable=yes

rem ��������� �� ���������� ������� WGET

DEL /F /Q "%LocalFolder%\ThreadSetup.msi"

"%LocalFolder%\wget.exe" %host%/ThreadSetup.msi -O "%LocalFolder%\ThreadSetup.msi" -c -t 38 -w 120 -T 1800

rem Uninstall Threads Plugin
SET THREADUTIL="Thread Utils"
echo "Uninstall %THREADUTIL% ..."
%SystemRoot%\System32\wbem\WMIC.EXE product where name=%THREADUTIL% call uninstall

rem Install Threads Plugin
if not exist "%LocalFolder%\ThreadSetup.msi" goto pass_Utils
echo "Install Threads Plugin..."
rem Distrib\ThreadsSetup.exe /VERYSILENT /NOCANCEL
%SystemRoot%\system32\msiexec.exe /i "%LocalFolder%\ThreadSetup.msi" /norestart /QN /L*V %TEMP%\ThreadSetup.log
:pass_Utils


rem ChangeDirectory
cd /d %curdirforurl%

rem ������� ������� ��� wget.exe � �����������
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"


rem ����� �� ��������. ������ - ������ �������.
exit /b 0
