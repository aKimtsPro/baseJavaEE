<#
    script à placer dans la racine du projet
    executer via cmd :          powershell -command ".\redeploy.ps1"
             via powershell :   .\redeploy.ps1

    modifier la valeur de $app_name pour : nomApp-versionApp (trouvable via pom.xml artId-version )
#>
Invoke-Expression -Command "$Env:CATALINA_HOME\bin\shutdown"

# declare var
$app_name = "jspThingy-1.0-SNAPSHOT"
# lets boogy
rm "$Env:CATALINA_HOME\webapps\$app_name.war"
rm "$Env:CATALINA_HOME\webapps\$app_name" -R
mvn clean package
cp "target\$app_name.war" "$Env:CATALINA_HOME\webapps"

Invoke-Expression -Command "$Env:CATALINA_HOME\bin\startup"