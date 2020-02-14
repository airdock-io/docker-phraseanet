FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /usr/local/bin/nginx-entrypoint
RUN wget -q -O /usr/local/bin/waitforit https://github.com/maxcnunes/waitforit/releases/download/v2.4.1/waitforit-linux_amd64 \
    && chmod +x /usr/local/bin/waitforit && chmod +x /usr/local/bin/nginx-entrypoint
ENTRYPOINT ["nginx-entrypoint"]
CMD ["nginx", "-g", "daemon off;"]