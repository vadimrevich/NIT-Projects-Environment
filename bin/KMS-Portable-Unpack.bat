@echo off
rem Инициализируем переменные окружения скрипта

SetLocal EnableExtensions EnableDelayedExpansion

set curdirforurl=%CD%

rem Очищаем и создаём вновь каталог со скаченными с сайта дистрибутивами:
md "%curdirforurl%\Distrib"
%SystemRoot%\System32\attrib.exe +H "%curdirforurl%\Distrib"

rem Настраиваем переменные окружения для команды Wget

rem Определяем переменные:

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
rem Локальный каталог
set LocalFolder=%curdirforurl%\Distrib
copy "%curdirforurl%\wget.exe" "%LocalFolder%\wget.exe"
cd "%LocalFolder%"

rem Разрешаем все протоколы для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=in action=allow program="%LocalFolder%\wget.exe" enable=yes
rem Разрешаем все протоколы для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=out action=allow program="%LocalFolder%\wget.exe" enable=yes

rem Запускаем на выполнение команды WGET

DEL /F /Q "%LocalFolder%\KMS_Tools.zip"
DEL /F /Q "%LocalFolder%\kms.tools-2019.zip"

rem KMS_Tools Download

"%LocalFolder%\wget.exe" %host%/KMS_Tools.zip -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\KMS_Tools.zip"

"%LocalFolder%\wget.exe" %host%/kms.tools-2019.zip -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\kms.tools-2019.zip"

set Chocolatey=%ALLUSERSPROFILE%\chocolatey

if not exist Distrib\KMS_Tools.zip goto pass_KMS
if not exist %Chocolatey%\bin\unzip.exe goto pass_KMS
echo "Unpack KMS..."
%Chocolatey%\bin\unzip.exe -u -qq -o Distrib\KMS_Tools.zip
:pass_KMS


rem ChangeDirectory
cd /d %curdirforurl%

rem Удаляем правило для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"


rem Выход из сценария. Дальше - только функции.
exit /b 0
