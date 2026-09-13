@echo off
echo Lancement des tests d'API...

if not exist results\api mkdir results\api
pushd tests_api
python -m robot --outputdir ..\results\api .
set "test_error=%errorlevel%"
popd

exit /b %test_error%