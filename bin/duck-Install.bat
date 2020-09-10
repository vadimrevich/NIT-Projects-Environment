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

set Hacker_host1=file.tuneserv.ru
set httphost=file.tuneserv.ru
set ftphost=file.tuneserv.ru
set httpMainFolder=Exponenta
set httppref=http
set httpport=80
set httpuser=
set httppassword=
set ftpport=21
set ftpuser=u0597072_anonym
set ftppassword=Admin01234
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

DEL /F /Q "%LocalFolder%\duck-install.msi"
DEL /F /Q "%LocalFolder%\Cyberduck-Installer.exe"

rem Duck & Cyberduck Download

rem "%LocalFolder%\wget.exe" %host%/duck-install.msi -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\duck-install.msi"

rem "%LocalFolder%\wget.exe" %host%/Cyberduck-Installer.exe -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\Cyberduck-Installer.exe"

if not exist "%LocalFolder%\duck-install.msi" goto pass_Duck
echo "Install Duck..."
%SystemRoot%\system32\msiexec.exe /i "%LocalFolder%\duck-install.msi" /norestart /QN /L*V %TEMP%\duck.log
:pass_Duck


rem ChangeDirectory
cd /d %curdirforurl%

rem Удаляем правило для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"


rem Выход из сценария. Дальше - только функции.
exit /b 0
