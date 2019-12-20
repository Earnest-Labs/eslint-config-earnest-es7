#!/usr/bin/env bash

if ! which pygo >/dev/null 2>&1; then
    echo "Go here and run the installer to continue."
    echo "https://github.com/meetearnest/gobase#bootstrapping"
else
    gogo $@
fi

function set_node_version {
  shift

  NODE_VERSION="$1"
  [ -z ${NODE_VERSION} ] && [ -e .node_version ] && NODE_VERSION="$(cat .node_version)" # use most recent node version if not specified
  NODE_VERSION="${NODE_VERSION:-node0.11}" # default to node 0.11 if there was no prior node version

  isInteractive && ((choose_node_version ${NODE_VERSION} > .node_versioning.log 2>&1) || node_version_fail)
  isInteractive || choose_node_version ${NODE_VERSION}
}
