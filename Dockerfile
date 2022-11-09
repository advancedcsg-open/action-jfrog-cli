FROM alpine:3.10

LABEL version="1.3.0"
LABEL repository="https://github.com/nhymxu/action-jfrog-cli-v1"
LABEL homepage="https://github.com/nhymxu/action-jfrog-cli-v1"
LABEL maintainer="Dung Nguyen (nhymxu)"
LABEL "com.github.actions.name"="jFrog CLI v1"
LABEL "com.github.actions.description"="Run jFrog CLI v1 commands"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="green"

RUN apk add curl
RUN apk add nodejs npm

RUN curl -fL https://getcli.jfrog.io | sh \
    && mv ./jfrog /usr/bin/ \
    && chmod +x /usr/bin/jfrog

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
