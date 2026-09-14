@echo off
set "ROOT=%~dp0"
pushd "%ROOT%"

echo Lancement de tous les tests...

call "%ROOT%run_api.bat"
if errorlevel 1 goto :failure

call "%ROOT%run_ihm.bat"
if errorlevel 1 goto :failure

call "%ROOT%run_unitaire.bat"
if errorlevel 1 goto :failure

echo Tous les tests se sont exécutés correctement.
popd
exit /b 0

:failure
set "TEST_ERROR=%errorlevel%"
popd
exit /b %TEST_ERROR%