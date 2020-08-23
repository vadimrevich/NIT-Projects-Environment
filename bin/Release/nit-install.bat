::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyFslLB5acCCNP363A7sI+9Tc5v6vt08hessLNb/J1b6LI/QA1kfte6of03ZfmdgJMBVRal+7fAA+rG1WpSmAOdGVoQDvR02H8gU9CGwU
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQIeAS8UaQqUNXm1CLgZ5vy7x+ODpkgTFMsxa5va1rju
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHeB4wIZJg9RXgqHKCuOA7YU5uf34O2Op15dfew8Nu8=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJECR8Ec+FD9bTxGPOWWuFYk74fzT+ui7jGQpGdItd4Xe2aCdHOIa5HnWcJoo12lfpMUFGFZRcAG/bwM45GZLsmCAOYmZqwqB
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
rem This script install the NIT Projects and Exponenta AdminPack On Computer
rem
if not exist .\nit-projects-environment.msi goto pass_NIT
echo "Uninstall NIT Ptojects Environment..."
wmic product where name="NIT Projects Environment" call uninstall
echo "Install nit-projects-environment..."
%SystemRoot%\system32\msiexec.exe /i nit-projects-environment.msi /norestart /QN /L*V %TEMP%\nit-projects-environment.log
:pass_NIT

