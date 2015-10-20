@echo off

set sikulix_jar=JarFiles/sikulixapi.jar

java -cp "%sikulix_jar%" ^
    -Dpython.path="%sikulix_jar%/Lib" ^
    --pythonpath=CustomRobotSikuliLibrary ^
    --outputdir=. ^
    --loglevel=DEBUG ^
    %*