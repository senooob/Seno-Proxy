FROM telegrammessenger/proxy:latest
ENV PORT=8080
EXPOSE 8080
# الكود الرسمي لتشغيل البروكسي مع المتغيرات التي ضبطناها في Railway
CMD ["/bin/sh", "-c", "/usr/bin/mtproto-proxy -u nobody -p 8888 -H $PORT -S $SECRET -P $AD_TAG --aes-pwd /etc/proxy-secret /etc/proxy-multi.conf"]
