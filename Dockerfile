FROM nishmal/mtproxy:latest
ENV PORT=8080
EXPOSE 8080
CMD ["sh", "-c", "/usr/local/bin/mtproto-proxy -u nobody -p $PORT -H $PORT -S $SECRET -P $AD_TAG --aes-pwd /etc/proxy-secret /etc/proxy-multi.conf"]
