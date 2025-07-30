FROM tomcat:9.0
COPY ./sample-web-app /usr/local/tomcat/webapps/sample
EXPOSE 8080
