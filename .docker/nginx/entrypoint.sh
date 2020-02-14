#!/usr/bin/env sh

export WAITFORIT_HOST=${WAITFORIT_HOST:=php}
export WAITFORIT_PORT=${WAITFORIT_PORT:=9000}
export WAITFORIT_TIMEOUT=${WAITFORIT_TIMEOUT:=240}
waitforit -host=${WAITFORIT_HOST} -port=${WAITFORIT_PORT} -timeout=${WAITFORIT_TIMEOUT} -retry=5000 -debug >> /dev/stdout

# Resume to "official" entrypoint
echo "Resuming to old entrypoint" >> /dev/stdout
echo "$@" >> /dev/stdout
exec "$@" >> /dev/stdout