# alpine image that already comes with java
FROM eclipse-temurin:8
# need bash for the wrapper and git for the spsauce command clone
RUN apt-get update -q -y
RUN apt-get install -q -y bash git
# copy stuff into the container.
COPY entrypoint.sh /entrypoint.sh
COPY sps /sps.sh
COPY spsauce/SPSauce-1.5.0.jar /spsauce/SPSauce-1.5.0.jar 
ENTRYPOINT ["/entrypoint.sh"]