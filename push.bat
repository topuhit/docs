@ECHO OFF
SET /p comment=Comment:
git add *
git commit -a -m "%comment%"