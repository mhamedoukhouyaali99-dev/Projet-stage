@echo off
echo Lancement des tests IHM...

if not exist results\ihm mkdir results\ihm
python -m robot --outputdir results\ihm tests_ihm

exit /b %errorlevel%