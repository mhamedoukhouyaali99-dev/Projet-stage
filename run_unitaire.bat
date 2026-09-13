@echo off
echo Lancement des tests unitaires...

python tests-unitaire\test-app.py

exit /b %errorlevel%