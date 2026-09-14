@echo off
set "ROOT=%~dp0"
pushd "%ROOT%"

echo Lancement des tests unitaires...

python "%ROOT%tests-unitaire\test-app.py"
set "test_error=%errorlevel%"

popd
exit /b %test_error%