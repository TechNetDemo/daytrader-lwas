FROM ibmcom/websphere-liberty:latest

COPY --chown=1001:0  daytrader.ear /config/dropins/
COPY --chown=1001:0  server.xml /config/
COPY --chown=1001:0  mysql-connector-java-5.1.46.jar /config/resources/Daytrader3SampleMysqlLibs/

# Replace Token with Environment Variable
RUN sed -i "s/@@@MYSQL_DAYTRADER_USER@@@/$MYSQL_DAYTRADER_USER/g" /config/server.xml
RUN sed -i "s/@@@MYSQL_DAYTRADER_PASSWORD@@@/$MYSQL_DAYTRADER_PASSWORD/g" /config/server.xml
RUN sed -i "s/@@@MYSQL_DAYTRADER_DB@@@/$MYSQL_DAYTRADER_DB/g" /config/server.xml
RUN sed -i "s/@@@MYSQL_DAYTRADER_SERVICE@@@/$MYSQL_DAYTRADER_SERVICE/g" /config/server.xml
RUN cat /config/server.xml

#RUN configure.sh
