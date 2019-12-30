#!/usr/bin/env bash

if ! which pygo >/dev/null 2>&1; then
    echo "Go here and run the installer to continue."
    echo "https://github.com/meetearnest/gobase#bootstrapping"
else
	pygo $@
fi