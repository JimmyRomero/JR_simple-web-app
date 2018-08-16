echo 'Stopping Tomcat service...'
sudo systemctl stop tomcat
sudo rm -f /opt/tomcat/webapps/JR_simple-web-app.war, ignoreError: true
sudo rm -rf /opt/tomcat/webapps/JR_simple-web-app, ignoreError: true

echo 'Sending war file...'
sudo cp -f /tmp/JR_simple-web-app.war /opt/tomcat/webapps/JR_simple-web-app.war
sudo rm /tmp/JR_simple-web-app.war

echo 'Starting Tomcat service...'
sudo systemctl start tomcat
