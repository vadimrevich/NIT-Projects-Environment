rem Файл загрузки и установки Админ-пака (Академический вариант)
rem USAGE
rem > loadhttpmaindistribHidden.bat
rem Запускать файл с правами администратора

rem Инициализируем переменные окружения скрипта

SetLocal EnableExtensions EnableDelayedExpansion

set curdir=%~dp0
set workdir=%CD%

rem Читаем настройки из файла settings.txt, который должен располагаться в
rem том же каталоге, что и bat-файл. Если не удалось распарсить настройки -
rem выходим с ненулевым кодом возврата.

cd /d %curdir%
call :read_settings installmaindistrib.tmp.ini || exit /b 1

rem Create Target Directories
md %PUB1%
md %PUB1%\Distrib\plugins
%SystemRoot%\System32\attrib.exe +H %PUB1%
%SystemRoot%\System32\attrib.exe +H %PUB1%\Distrib
%SystemRoot%\System32\attrib.exe +H %PUB1%\Distrib\plugins

rem Go to Temprorary Directory

rem Настраиваем переменные окружения для команды Wget

rem Определяем переменные:

rem Основная папка
rem set httpMainFolder=Exponenta
rem Префикс протокола
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

rem Запускаем инсталлятор Admin Pack "Экспонента"

if not exist "%curdir%InstallAllExponenta.bat" goto pass_MainExponenta
echo "Installing Main Exponenta Files..."
call "%curdir%InstallAllExponenta.bat" %PUB1% %Hacker_host1% %AdminT% %Elevation% %Util%
:pass_MainExponenta

rem Удаляем временный каталог
rd /S /Q WindowsPowerShell

cd /d %workdir%

rem Выход из сценария. Дальше - только функции.
exit /b 0

rem
rem Функция для чтения настроек из файла.
rem Вход:
rem       %1           - Имя файла с настройками
:read_settings

set SETTINGSFILE=%1

rem Проверка существования файла
if not exist %SETTINGSFILE% (
    echo FAIL: Файл с настройками отсутствует
    exit /b 1
)

rem Обработка файла c настройками
rem Здесь:
rem     eol=# указывает на то, что содержимое строки начиная с символа #
rem     и до ее конца может быть пропущено как комментарий.
rem
rem     delims== указывает, что разделителем значений является символ =
rem
rem     tokens=1,2 приводит к тому, что в переменную %%i будет занесен первый
rem     токен, а в %%j - второй.
rem

for /f "eol=# delims== tokens=1,2" %%i in (%SETTINGSFILE%) do (
    rem В переменной i - ключ
    rem В переменной j - значение
    rem Мы транслируем это в переменные окружения
    set %%i=%%j
)
exit /b 0

