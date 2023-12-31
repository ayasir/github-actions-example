FROM openjdk:18-jdk-alpine
VOLUME /tmp
#COPY ./AppServerAgent/ ./target/
COPY target/*.jar test-repo.jar
ENV APPDYNAMICS_AGENT_APPLICATION_NAME=rta-one
ENV APPDYNAMICS_AGENT_TIER_NAME=app
ENV APPDYNAMICS_AGENT_ACCOUNT_NAME=rta-dev
ENV APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=gksVWvQgnhJ@78D
ENV APPDYNAMICS_CONTROLLER_HOST_NAME=https://rta-dev.saas.appdynamics.com
ENV APPDYNAMICS_CONTROLLER_PORT=443
ENV APPDYNAMICS_CONTROLLER_SSL_ENABLED=true
ENV APPDYNAMICS_JAVA_AGENT_REUSE_NODE_NAME=true
ENV APPDYNAMICS_JAVA_AGENT_REUSE_NODE_NAME_PREFIX=worker.1
#ENV JAVA_OPTS -javaagent:/opt/appdynamics/javaagent.jar
#ENV JAVA_TOOL_OPTIONS -javaagent:./target/javaagent.jar
ENTRYPOINT ["java", "-jar","/test-repo.jar"]