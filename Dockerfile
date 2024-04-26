ARG NVM_TAG

FROM dwolla/jenkins-agent-nvm:${NVM_TAG}
LABEL maintainer="Dwolla Dev <dev+jenkins-agent-terraform@dwolla.com>"
LABEL org.label-schema.vcs-url="https://github.com/Dwolla/jenkins-agent-docker-terraform"

USER root
RUN chown -R jenkins ${JENKINS_HOME}

ENV TFSWITCH_HOME="${JENKINS_HOME}/.bin" \
    TERRAFORM_VERSION=0.14.11
ENV PATH=${TFSWITCH_HOME}:$PATH

RUN curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh > install.sh \
    && chmod 755 install.sh \    
    && ./install.sh -b "${JENKINS_HOME}/.bin"

RUN chown -R jenkins:jenkins "${JENKINS_HOME}/.bin"

USER jenkins
RUN $TFSWITCH_HOME/tfswitch -b $TFSWITCH_HOME/terraform $TERRAFORM_VERSION