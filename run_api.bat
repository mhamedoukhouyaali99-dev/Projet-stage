@echo off
set "ROOT=%~dp0"
pushd "%ROOT%"

echo Lancement des tests d'API...

if not exist "%ROOT%results\api" mkdir "%ROOT%results\api"
pushd tests_api
python -m robot --outputdir ..\results\api .
set "test_error=%errorlevel%"
popd

popd
exit /b %test_error%