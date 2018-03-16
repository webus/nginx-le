FROM openresty/openresty:alpine-fat

RUN rm -rf /usr/local/openresty/nginx/conf/nginx.conf
ADD conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

ADD script/entrypoint.sh /entrypoint.sh
ADD script/le.sh /le.sh

RUN \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 apk add  --update certbot tzdata openssl && \
 rm -rf /var/cache/apk/*

CMD ["/entrypoint.sh"]
