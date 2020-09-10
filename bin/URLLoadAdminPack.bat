rem Файл загрузки и установки дистрибутивов для Админ-пака (Академический вариант)
rem USAGE
rem > URLLoadAdminPack.bat
rem Запускать файл с правами администратора

rem Данный файл должен быть переопределён для каждого нового места хранения
rem инсталляционных файлов админ-пака
rem С целью секретности данный файл не помещён в открытое хранилище GitHub

rem По-умолчанию место хранения инсталляционных файлов Админ-пака Экспонента:
rem http://file.tuneserv.ru/Exponenta

rem Инициализируем переменные окружения скрипта

SetLocal EnableExtensions EnableDelayedExpansion

set curdirforurl=%CD%

rem Очищаем и создаём вновь каталог со скаченными с сайта дистрибутивами:
rd /S /Q "%curdirforurl%\Distrib"
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
rem !!! Изменяемая величина! Проверять перед использованием !!!

rem wget -c -t 2 --content-disposition %host%/InstallMainExponenta.bat

rem Main Files
rem ****

rem "%LocalFolder%\wget.exe" %host%/prechocoinstall.bat -O "%curdirforurl%\prechocoinstall.bat" -c -t 38 -w 120 -T 1800
"%LocalFolder%\wget.exe" %host%/ExponentaMainFilesSetup.exe -O "%LocalFolder%\ExponentaMainFilesSetup.exe" -c -t 38 -w 120 -T 1800
"%LocalFolder%\wget.exe" %host%/HiddenStartSetupRePack.exe -O "%LocalFolder%\HiddenStartSetupRePack.exe" -c -t 38 -w 120 -T 1800

rem dotNetFx 4.0 Download

rem "%LocalFolder%\wget.exe" %host%/dotNetFx40_Full_x86_x64.exe  -O "%LocalFolder%\dotNetFx40_Full_x86_x64.exe" -c -t 38 -w 120 -T 1800

rem KB968930 download

rem "%LocalFolder%\wget.exe" %host%/WindowsServer2003-KB968930-x64-RUS.exe -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\WindowsServer2003-KB968930-x64-RUS.exe"

rem "%LocalFolder%\wget.exe" %host%/WindowsServer2003-KB968930-x86-RUS.exe -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\WindowsServer2003-KB968930-x86-RUS.exe"

rem "%LocalFolder%\wget.exe" %host%/WindowsXP-KB968930-x86-RUS.exe -t 38 -c -w 120 -T 1800 -O "%LocalFolder%\WindowsXP-KB968930-x86-RUS.exe"


rem Additional Packets
rem ****

"%LocalFolder%\wget.exe" %host%/Scripts.Set01.msi -O "%LocalFolder%\Scripts.Set01.msi" -c -t 38 -w 120 -T 1800
"%LocalFolder%\wget.exe" %host%/AdminTExponentaPluginSetup.exe -O "%LocalFolder%\AdminTExponentaPluginSetup.exe" -c -t 38 -w 120 -T 1800
"%LocalFolder%\wget.exe" %host%/ElevationSetupRepack.exe -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\ElevationSetupRepack.exe"
rem "%LocalFolder%\wget.exe" %host%/UtilPackSetup.exe -O "%LocalFolder%\UtilPackSetup.exe" -c -t 38 -w 120 -T 1800
rem "%LocalFolder%\wget.exe" %host%/ThreadSetup.msi -O "%LocalFolder%\ThreadSetup.msi" -c -t 38 -w 120 -T 1800
rem "%LocalFolder%\wget.exe" %host%/sordum.org.msi -O "%LocalFolder%\sordum.org.msi" -c -t 38 -w 120 -T 1800

rem WSO Download

"%LocalFolder%\wget.exe" %host%//wso.exe -O "%LocalFolder%\wso.exe" -c -t 38 -w 120 -T 1800

rem jdk-8u211 download

rem "%LocalFolder%\wget.exe" %host%/jdk-8u211-windows-i586.exe -O "%LocalFolder%\jdk-windows-i586.exe" -c -t 38 -w 120 -T 1800

rem "%LocalFolder%\wget.exe" %host%/jdk-8u211-windows-x64.exe -O "%LocalFolder%\jdk-windows-x64.exe" -c -t 38 -w 120 -T 1800

rem "%LocalFolder%\wget.exe" %host%/jre-8u211-windows-i586.exe -O "%LocalFolder%\jre-windows-i586.exe" -c -t 38 -w 120 -T 1800

rem "%LocalFolder%\wget.exe" %host%/jre-8u211-windows-x64.exe -O "%LocalFolder%\jre-windows-x64.exe" -c -t 38 -w 120 -T 1800


rem Auxiliary Packets
rem ****

rem "%LocalFolder%\wget.exe" %host%/Hydra-Installer.exe -O %LocalFolder%\Hydra-Installer.exe -t 38 -w 120 -T 1800

rem Daemon Tools Lite Download

"%LocalFolder%\wget.exe" %host%/DTLiteInstaller.exe -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\DTLiteInstaller.exe"

rem KMS_Tools Download

rem "%LocalFolder%\wget.exe" %host%/KMS_Tools.zip -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\KMS_Tools.zip"

rem "%LocalFolder%\wget.exe" %host%/kms.tools-2019.zip -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\kms.tools-2019.zip"

rem Duck & Cyberduck Download

rem "%LocalFolder%\wget.exe" %host%/duck-install.msi -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\duck-install.msi"

rem "%LocalFolder%\wget.exe" %host%/Cyberduck-Installer.exe -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\Cyberduck-Installer.exe"

rem New HiddenStart Download

"%LocalFolder%\wget.exe" %host%/Hstart_4.6-setup.exe -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\Hstart_4.6-setup.exe"

rem ussf Download

"%LocalFolder%\wget.exe" %host%/ussf.exe -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\ussf.exe"

rem PowerShell Core Download

rem "%LocalFolder%\wget.exe" %host%/PowerShell-6.2.1-win-x86.msi -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\PowerShell-6.2.1-win-x86.msi"

rem "%LocalFolder%\wget.exe" %host%/PowerShell-6.2.1-win-x64.msi -c -t 38 -w 120 -T 1800 -O "%LocalFolder%\PowerShell-6.2.1-win-x64.msi"

rem Special Download for Upgrade
rem "%LocalFolder%\wget.exe" %host%/special-auxilary-download.bat -O "%LocalFolder%\special-auxilary-download.bat" -c -t 38 -w 120 -T 1800


rem "%LocalFolder%\wget.exe" -c -t 2 --content-disposition %host%/installmaindistrib.bat
rem "%LocalFolder%\wget.exe" --http-user=%httpuser% -nc --http-passwd=%httppassword% %host%/chock.install.cmd
rem "%LocalFolder%\wget.exe" -r --no-parent %host%/

rem ChangeDirectory
cd /d %curdirforurl%

rem Удаляем правило для wget.exe в брандмауэре
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"


rem Выход из сценария. Дальше - только функции.
exit /b 0
