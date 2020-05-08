FROM tomcat:9

WORKDIR /usr/local/tomcat

ADD smitlimbani/smitcalc.war webapps/
