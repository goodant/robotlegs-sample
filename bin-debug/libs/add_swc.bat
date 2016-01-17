rem Need inspall one swc file for run. Please rem line with installed file before install next.
rem mvn install:install-file -Dfile=templates.swc -DgroupId=my.templates.local -DartifactId=templates -Dversion=1.0 -Dpackaging=swc -DgeneratePom=true -DcreateChecksum=true > install.log
mvn install:install-file -Dfile=robotlegs-framework-1.5.2.swc -DgroupId=org.robotlegs.local -DartifactId=robotlegs-framework -Dversion=1.5.2 -Dpackaging=swc -DgeneratePom=true -DcreateChecksum=true >> install.log
