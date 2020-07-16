#!/bin/sh

bin/console compile:configuration >> /dev/stdout
bin/developer orm:generate-proxies >> /dev/stdout
bin/console searchengine:index:create >> /dev/stdout
chmod -R 777 logs cache config tmp www datas
[ ! -d "datas/phrasea_data/documents" ] && mkdir -p -m 777 datas/phrasea_data/documents

if [ "$RUN_AS_WORKER" = true ]
then
  echo "Initialising Phrasea Configuration and Proxies" >> /dev/stdout
  bin/console task-manager:scheduler:run -vvv
fi
