FROM alpine:3.10

LABEL version="0.0.1"
LABEL repository="https://github.com/advancedcsg-open/action-jfrog-cli"
LABEL homepage="https://github.com/advancedcsg-open/action-jfrog-cli"
LABEL maintainer="Advanced Toolchain"
LABEL "com.github.actions.name"="jFrog CLI"
LABEL "com.github.actions.description"="Run jFrog CLI commands"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="green"

RUN apk add curl

RUN curl -fL https://getcli.jfrog.io | sh \
    && mv ./jfrog /usr/bin/ \
    && chmod +x /usr/bin/jfrog

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
