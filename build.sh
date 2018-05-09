#!/bin/sh

# Init
cd $(dirname "$0")

# Helpers
showUsage() {

echo "\
Usage:\n\n\
\t$ <script> [options]\n\n\
\t-h: Get help.
\t-s: Skip pushing.
"
}

# Main
while getopts 'hs' OPTION; do
	case "$OPTION" in
		h)
				showUsage
				exit
			;;

		s)
			skipPushing='n'
			;;

		?)
			echo "$(showUsage)" >&2
			exit 1
			;;
	esac
done

docker build -t viswanathct/dui .

if [ "$skipPushing" != "n" ]
then

  docker push viswanathct/dui

fi
