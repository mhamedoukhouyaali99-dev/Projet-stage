@echo off
set "ROOT=%~dp0"
pushd "%ROOT%"

echo Lancement des tests IHM...

if not exist "%ROOT%results\ihm" mkdir "%ROOT%results\ihm"
python -m robot --outputdir "%ROOT%results\ihm" "%ROOT%tests_ihm"
set "test_error=%errorlevel%"

popd
exit /b %test_error%