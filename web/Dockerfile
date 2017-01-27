FROM tomcat:8-jre8
MAINTAINER duggankimani
#RUN echo "export JAVA_OPTS=\"-Dapp.env=staging\"" > /usr/local/tomcat/bin/setenv.sh
RUN echo "CATALINA_OPTS=\"-Dbtm.root=$CATALINA_HOME -Dbitronix.tm.configuration=$CATALINA_HOME/conf/btm-config.properties -Djava.io.tmpdir=$CATALINA_HOME/temp -XX:PermSize=256m -XX:MaxPermSize=256m $JAVA_OPTS -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false\"" > /usr/local/tomcat/bin/setenv.sh

RUN echo 'Downloading app.war, please wait.. [170mb]'
ADD https://wira.workpoint.co.ke/downloads/app.war /usr/local/tomcat/webapps/app.war
#ADD http://localhost/downloads/app.war /usr/local/tomcat/webapps/app.war
RUN echo 'Downloading tomcat configs.. this is a smaller file, bear or is it beer with us :)'
ADD https://wira.workpoint.co.ke/downloads/configs.tar.gz /usr/local/tomcat/
#ADD http://localhost/downloads/configs.tar.gz /usr/local/tomcat/
RUN tar -zxvf /usr/local/tomcat/configs.tar.gz

RUN ls /usr/local/tomcat/configs

RUN cp /usr/local/tomcat/configs/conf/* /usr/local/tomcat/conf/
RUN cp /usr/local/tomcat/configs/lib/* /usr/local/tomcat/lib/

RUN ls /usr/local/tomcat/lib/

RUN echo "resource.ds.driverProperties.user=postgres" >> /usr/local/tomcat/conf/resources.properties
RUN echo "resource.ds.driverProperties.password=postgres" >> /usr/local/tomcat/conf/resources.properties
RUN echo "resource.ds.driverProperties.serverName=db" >> /usr/local/tomcat/conf/resources.properties
RUN echo "resource.ds.driverProperties.databaseName=workflow" >> /usr/local/tomcat/conf/resources.properties

#ADD ./wait-for-postgres.sh /usr/bin/

ADD TestConnection.class /usr/local/tomcat/lib/
ADD wait-for-connection.sh /usr/bin/wait-for-connection.sh
RUN chmod +x /usr/bin/wait-for-connection.sh

#RUN export PATH=$PATH:/usr/local/tomcat/bin
RUN echo "PATH = "$PATH
CMD ["catalina.sh","run"]
