@echo off
echo Lancement de tous les tests...

call run_api.bat
if errorlevel 1 exit /b 1

call run_ihm.bat
if errorlevel 1 exit /b 1

call run_unitaire.bat
if errorlevel 1 exit /b 1

echo Tous les tests se sont exécutés correctement.
exit /b 0