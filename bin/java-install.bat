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

DEL /F /Q "%LocalFolder%\jdk-windows-i586.exe"
DEL /F /Q "%LocalFolder%\jdk-windows-x64.exe"
DEL /F /Q "%LocalFolder%\jre-windows-i586.exe"
DEL /F /Q "%LocalFolder%\jre-windows-x64.exe"

rem jdk-8u211 download

"%LocalFolder%\wget.exe" %host%/jdk-8u211-windows-i586.exe -O "%LocalFolder%\jdk-windows-i586.exe" -c -t 38 -w 120 -T 1800

"%LocalFolder%\wget.exe" %host%/jdk-8u211-windows-x64.exe -O "%LocalFolder%\jdk-windows-x64.exe" -c -t 38 -w 120 -T 1800

rem "%LocalFolder%\wget.exe" %host%/jre-8u211-windows-i586.exe -O "%LocalFolder%\jre-windows-i586.exe" -c -t 38 -w 120 -T 1800

rem "%LocalFolder%\wget.exe" %host%/jre-8u211-windows-x64.exe -O "%LocalFolder%\jre-windows-x64.exe" -c -t 38 -w 120 -T 1800

rem Install JRE8 & JDK8
if not exist "%LocalFolder%\jdk-windows-x64.exe" goto pass_java
if not exist "%LocalFolder%\jdk-windows-i586.exe" goto pass_java
rem if not exist "%LocalFolder%\jre-windows-x64.exe" goto pass_java
rem if not exist "%LocalFolder%\jre-windows-i586.exe" goto pass_java
echo "Install Java (JRE8 + JDK8) Update ..."
rem "%LocalFolder%\jre-windows-i586.exe" /s
rem "%LocalFolder%\jre-windows-x64.exe" /s
"%LocalFolder%\jdk-windows-i586.exe" /s
"%LocalFolder%\jdk-windows-x64.exe" /s
:pass_java


rem ChangeDirectory
cd /d %curdirforurl%

rem Удаляем правило для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"


rem Выход из сценария. Дальше - только функции.
exit /b 0
