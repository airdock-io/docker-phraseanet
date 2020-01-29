#!/bin/sh

docker_process_init_files() {
	echo
	local f
	for f; do
		case "$f" in
			*.sh)
				# https://github.com/docker-library/postgres/issues/450#issuecomment-393167936
				# https://github.com/docker-library/postgres/pull/452
				if [ -x "$f" ]; then
					echo "$0: running $f"
					"$f"
				else
					echo "$0: sourcing $f"
					. "$f"
				fi
				;;
			*)        echo "$0: ignoring $f" ;;
		esac
		echo
	done
}
docker_process_init_files /docker-entrypoint-init.d/*

echo "MYSQL_STATUS=pending" >> .phrasea_init.env
echo "ELASTIC_STATUS=pending" >> .phrasea_init.env
echo "Waiting for DB" >> /dev/stdout
wait-for-it -t ${WAITFORIT_TIMEOUT} ${MYSQL_HOST}:3306 --strict -- sed -i 's/MYSQL_STATUS=pending/MYSQL_STATUS=up/g' .phrasea_init.env
wait-for-it -t ${WAITFORIT_TIMEOUT} ${ELASTIC_HOST}:9200 --strict -- sed -i 's/ELASTIC_STATUS=pending/ELASTIC_STATUS=up/g' .phrasea_init.env

source .phrasea_init.env && rm -rf .phrasea_init.env

if [ "$MYSQL_STATUS" = true ] && [ "$ELASTIC_STATUS" = true ]
then
  echo "Initialising Phrasea Configuration and Proxies" >> /dev/stdout
  phrasea-init
else
  echo "Ignoring Phrasea Init... To run it, enter a shell and please execute: phrasea-init" >> /dev/stdout
fi

# Resume to "official" entrypoint
echo "Resuming to old entrypoint" >> /dev/stdout
echo "$@" >> /dev/stdout
docker-php-entrypoint "$@"
