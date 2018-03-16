@ECHO OFF
SET /p comment=Comment:
git add *
git commit -a -m "%comment%"
git remote add origin https://github.com/topuhit/docs/
git remote -v
git push origin master