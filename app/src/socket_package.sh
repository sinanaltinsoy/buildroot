#!/bin/sh

case "$1" in
  start)
    echo "Starting Socket Package"
    start-stop-daemon -S -n socket_package -a /usr/bin/socket_package -- -d
	;;
  stop)
    echo "Stopping Socket Package"
    start-stop-daemon -K -n socket_package
	;;
  *)
      echo "Usage: $0 (start | stop)"
    ;; 
esac

exit 0