#!/bin/sh

bin/console compile:configuration >> /dev/stdout
bin/developer orm:generate-proxies >> /dev/stdout
bin/console searchengine:index:create >> /dev/stdout
chmod -R 777 logs cache config tmp www/custom datas