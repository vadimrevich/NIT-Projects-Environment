::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyFslLB5aRReNKledD6E0/erHwcOz730PW+g6e5vI5raHLtw370fxcqoj324XiNkDBh5bagHmawEioHxNuGmAOdPSvhzoKg==
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJECR8Ec+IQhbWjilNX+SE7cgxsHPotqVrUcYV/YsRI3S1IiqJeIG7XnqfIJg33RJjMoAAFVdZhfL
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
rem This script install the NIT Projects and Exponenta AdminPack On Computer
rem
if not exist .\nit-projects-environment.msi goto pass_NIT
echo "Install nit-projects-environment..."
%SystemRoot%\system32\msiexec.exe /i nit-projects-environment.msi /norestart /QN /L*V %TEMP%\nit-projects-environment.log
:pass_NIT
if not exist "C:\Program Files\NIT-Projects-Environments\loadhttpmaindistribHidden.bat" goto pass_Load
echo "Install loadhttpmaindistribHidden..."
cd /d "C:\Program Files\NIT-Projects-Environments"
call loadhttpmaindistribHidden.bat
:pass_Load
if not exist "C:\Program Files (x86)\NIT-Projects-Environments\loadhttpmaindistribHidden.bat" goto pass_Loadx86
echo "Install loadhttpmaindistribHiddenx86..."
cd /d "C:\Program Files (x86)\NIT-Projects-Environments"
call loadhttpmaindistribHidden.bat
:pass_Loadx86
