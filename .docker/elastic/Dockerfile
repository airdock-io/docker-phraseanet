FROM elastic:2.4-alpine

COPY entrypoint.sh /docker-entrypoint.d/docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.d/docker-entrypoint.sh"]
CMD ["elasticsearch", "-Des.http.port=9200 -Des.http.cors.allow-origin=\"*\" -Des.http.cors.enabled=true -Des.http.cors.allow-headers=X-Requested-With,X-Auth-Token,Content-Type,Content-Length,Authorization -Des.http.cors.allow-credentials=true -Des.http.cors.allowed-methods=\"*\""]