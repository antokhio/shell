@echo off
set folders=node_modules, bin, obj
echo This will delete all [%folders%] folders recursively and cannot be undone.
choice /t 10 /d n /c yn /m "Press Y to continue, N to stop"
if %errorLevel% neq 1 goto :EOF
for /d /r . %%D in (%folders%) do if exist "%%~fD\" (echo %%D && rd "%%~fD" /s /q)