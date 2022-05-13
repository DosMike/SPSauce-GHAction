# alpine image that already comes with java
FROM eclipse-temurin:8-alpine
# need bash for the wrapper and git for the spsauce command clone
RUN apk update
RUN apk add bash git
# copy stuff into the container. use the wrapper as entrypoint script
# (renaming for familiarity)
COPY sps /entrypoint.sh
COPY spsauce/ /spsauce/
# fetch all necessary dependencies to run sps and commit
RUN /entrypoint.sh -?

ENTRYPOINT ["/entrypoint.sh"]
# calling the action with
# - name
#   with:
#     args: cmdline
# now allows for a commandline to be passed directly to SPSauce
# e.g. with args: "build.sauce --GITHUB_TOKEN ${{secret.GITHUB_TOKEN}}"
