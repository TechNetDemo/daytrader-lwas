FROM websphere-liberty:kernel
COPY --chown=1001:0  daytrader.ear /config/dropins/
COPY --chown=1001:0  server.xml /config/
COPY --chown=1001:0  mysql-connector-java-5.1.46.jar /config/resources/Daytrader3SampleMysqlLibs/
RUN configure.sh
