set -euo pipefail
IFS=$'\n\t'

SERVICE_NAME=dev-prod-automation-demo
DOCKER_IMAGE_NAME=earnest/${SERVICE_NAME}
RUNDECK_IMAGE=earnest/rundeck:4.0.0

function prep_for_ci {
  : ${JENKINS_HOME?These scripts are designed to be run within CI. Aborting in a cowardly fashion.}
}


[ -n "${SKIP_CI_PREP-}" ] || prep_for_ci
