  #!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function prep_for_ci {
  : ${JENKINS_HOME?These scripts are designed to be run within CI. Aborting in a cowardly fashion.}
}

[ -n "${SKIP_CI_PREP-}" ] || prep_for_ci