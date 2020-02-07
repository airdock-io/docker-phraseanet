[![dockeri.co](https://dockeri.co/image/airdock/phraseanet)](https://hub.docker.com/r/airdock/phraseanet)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)](https://GitHub.com/airdock-io/docker-phraseanet/graphs/commit-activity)
[![Ask Us Anything !](https://img.shields.io/badge/Ask%20us-anything-1abc9c.svg?style=for-the-badge)](https://github.com/airdock-io)
![Open Source Love svg1](https://img.shields.io/static/v1?label=OpenSource&message=%E2%9D%A4&color=blue&style=for-the-badge)]

[![GitHub issues](https://img.shields.io/github/issues/airdock-io/docker-phraseanet.svg?style=flat-square)](https://GitHub.com/airdock-io/docker-phraseanet/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/airdock-io/docker-phraseanet.svg?style=flat-square)](https://GitHub.com/airdock-io/docker-phraseanet/issues?q=is%3Aissue+is%3Aclosed)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://lbesson.mit-license.org/)


![Phraseanet](https://www.phraseanet.com/wp-content/uploads/2016/05/phrasea-logo-PAYSAGE.jpg)
# docker-phraseanet
A repository to use Phraseanet with Docker

## Prerequisites

  - Having Docker and docker-compose installed (=> https://docs.docker.com/install/ & https://docs.docker.com/compose/install/)

## Getting started
Just clone the repo with the usual : ```git clone https://github.com/airdock-io/docker-phraseanet.git```
 - Enter the repo
 - Type ```make launch```
 - If you want to see logs ```make logs```
 - If you want to stop the project ```make stop```
 - If you want to kill the project and remove volumes and all ```make kill```

Once the project is launched, and every service is ready you will have access to phraseanet and various services for the project. Th project follows prerequisites of phraseanet and lauch the following services:


| Service                     | Port | Url                    |
|-----------------------------|------|------------------------|
| Phrasea (nginx + php-fpm)   | 80   | http://localhost:80    |
| Database MySQL + PhpMyAdmin | 9003 | http://localhost:9003  |
| Elastic + ElasticHQ GUI     | 9010 | http://localhost:9010  |
| Elastic + DejaVu GUI        | 9005 | http://localhost:9005  |
| SMTP Mock                   | 8025 | http://localhost:8025  |
 
## User Account

To Login you will need credentials, firsts one availables at launch are:
``` 
login: test@domain.name
password: Administrator1
```
## Elastic
Elasticsearch is in version 2.1, 2.2, 2.3 or 2.4 (mandatory), this version is not supported by Elastic anymore.

## Database (MySQL)
Phraseanet comes bundled with two databses: phrasea and phrasea_data. You can find schemas imported in *.docker/mysql/{db_name}.sql*

## Environment variables
Some of these vars are defined in the Dockerfile and others are not. Vars used by the entrypoint and command should be defined in dockerfile, vars relative to the phrasea php app are defined (if not in compose *environment* section) in entrypoint with a default value.

| Var                     | Default Value |
|-------------------------|---------------|
| WAITFORIT_TIMEOUT       | 120           |
| MYSQL_HOST              | mysql         |
| ELASTIC_HOST            | elastic       |
| MYSQL_USER              | root          |
| MYSQL_PWD               | phrasea       |
| MYSQL_DB_NAME           | phrasea       |
| SMTP_HOST               | smtp          |
| SMTP_USER               | null          |
| SMTP_PWD                | null          |

WAITFORIT_TIMEOUT is the value passed to wait-for-it.sh, for more information see [wait-for-it](https://github.com/vishnubob/wait-for-it)

## Docker image as standalone
The image itself provided does not have any config file in it so you will have to mount them in it.
If you wish to integrate your config files to package the app and other services as containers, Dockerfiles are provided in the .docker repositories to do so :)