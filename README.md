# Jenkins Agent with Terraform Build Tools

[![](https://images.microbadger.com/badges/image/dwolla/jenkins-agent-terraform.svg)](https://microbadger.com/images/dwolla/jenkins-agent-terraform)
[![license](https://img.shields.io/github/license/dwolla/jenkins-agent-docker-terraform.svg?style=flat-square)](https://github.com/Dwolla/jenkins-agent-docker-terraform/blob/master/LICENSE)

Docker image based on [Dwolla’s core Jenkins Agent Docker image](https://github.com/Dwolla/jenkins-agent-docker-core) making Terraform build tools available to Jenkins jobs.

GitHub Actions will build the Docker images for multiple supported architectures.

## Local Development

With [yq](https://kislyuk.github.io/yq/) installed, to build this image locally run the following command:

```bash
make \
    NVM_TAG=$(curl --silent https://raw.githubusercontent.com/Dwolla/jenkins-agents-workflow/main/.github/workflows/build-docker-image.yml | \
        yq .on.workflow_call.inputs.NVM_TAG.default) \
    all
```

Alternatively, without [yq](https://kislyuk.github.io/yq/) installed, refer to the NVM_TAG default values defined in [jenkins-agents-workflow](https://github.com/Dwolla/jenkins-agents-workflow/blob/main/.github/workflows/build-docker-image.yml) and run the following command:

`make NVM_TAG=<default-nvm-tag-from-jenkins-agents-workflow> all`