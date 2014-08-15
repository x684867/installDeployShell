#!/bin/bash
#
# setup.sh
#
# (c) 2014 Sam Caldwell.  MIT License
#
CMD=$(which vagrant)
$CMD --version || {
	echo "vagrant not installed."
	exit 1
}

export PROVIDER=""
if [ -z $1 ]; then
	echo "Provider not specified.  Using default"
	#
	# Identify the (local) provider...
	#
	[ "$PROVIDER" == "" ] && {
		CMD=$(which prlctl)
		[ ! -z $CMD ] && \
			$CMD --version && export PROVIDER="parallels"
	}
	#
	# Test for more (local) providers here.
	#
	[ "$PROVIDER" == "" ] && {
		CMD=$(which vbox)
		[ ! -z $CMD ] && \
			$CMD --version && export PROVIDER="vbox"
	}
	#
	# (Local) Provider should be identified by this point.
	#
else
	echo "Provider configured as $1"
	case "$1" in 
		"google")
			export PROVIDER="$1"
			;;
		"aws")
			export PROVIDER="$1"
			;;
		"digitalocean")
			export PROVIDER="$1"
			;;
		*)
			echo "unknown provider ($1)"
			exit 1
	esac
fi
vagrant up --provider=$PROVIDER 