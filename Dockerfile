FROM tomcat:9

WORKDIR /usr/local/tomcat

ADD target/smitcalc.war webapps/
