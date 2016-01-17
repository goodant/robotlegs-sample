mvn install:install-file -Dfile=src/libs/robotlegs-framework-1.5.2.swc -DgroupId=org.robotlegs.local -DartifactId=robotlegs-framework -Dversion=1.5.2 -Dpackaging=swc -DgeneratePom=true -DcreateChecksum=true
rem mvn install -e -s .settings.xml > make_app.log
pause