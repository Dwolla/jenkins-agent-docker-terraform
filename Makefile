NVM_TAG := $(CORE_JDK11_TAG)
JOB := core-${NVM_TAG}
CLEAN_JOB := clean-${NVM_TAG}

all: ${JOB}
clean: ${CLEAN_JOB}
.PHONY: all clean ${JOB} ${CLEAN_JOB}

${JOB}: core-%: Dockerfile
	docker build \
	  --build-arg NVM_TAG=$* \
	  --tag dwolla/jenkins-agent-terraform:$*-SNAPSHOT \
	  --progress=plain \
	  .

${CLEAN_JOB}: clean-%:
	docker image rm --force dwolla/jenkins-agent-terraform:$*-SNAPSHOT
