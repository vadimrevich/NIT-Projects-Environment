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

DEL /F /Q "%LocalFolder%\PowerShell-6.2.1-win-x86.msi"
DEL /F /Q "%LocalFolder%\PowerShell-6.2.1-win-x64.msi"

rem PowerShell Core Download

"%LocalFolder%\wget.exe" %host%/PowerShell-6.2.1-win-x86.msi -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\PowerShell-6.2.1-win-x86.msi"

"%LocalFolder%\wget.exe" %host%/PowerShell-6.2.1-win-x64.msi -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\PowerShell-6.2.1-win-x64.msi"

rem Install Powershell Core
if not exist "%LocalFolder%\PowerShell-6.2.1-win-x86.msi" goto pass_posh
if not exist "%LocalFolder%\PowerShell-6.2.1-win-x64.msi" goto pass_posh
echo "Install PowerShell Core ..."
%SystemRoot%\system32\msiexec.exe /i "%LocalFolder%\PowerShell-6.2.1-win-x86.msi" /norestart /QN /L*V %TEMP%\pwshx32.log
%SystemRoot%\system32\msiexec.exe /i "%LocalFolder%\PowerShell-6.2.1-win-x64.msi" /norestart /QN /L*V %TEMP%\pwshx64.log
:pass_posh

rem ChangeDirectory
cd /d %curdirforurl%

rem Удаляем правило для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"


rem Выход из сценария. Дальше - только функции.
exit /b 0
