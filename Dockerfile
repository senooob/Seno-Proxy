FROM telegrammessenger/proxy:latest

# تثبيت curl لتحميل الإعدادات وتجهيز الملفات
RUN apt-get update && apt-get install -y curl && \
    curl -s https://core.telegram.org/getProxyConfig -o /etc/proxy-multi.conf && \
    head -c 16 /dev/urandom > /etc/proxy-secret

ENV PORT=8080
EXPOSE 8080

# تشغيل البروكسي مع ربط المنفذ والمتغيرات بشكل صحيح
CMD ["/bin/sh", "-c", "mtproto-proxy -u nobody -p 8888 -H $PORT -S $SECRET -P $AD_TAG --aes-pwd /etc/proxy-secret /etc/proxy-multi.conf"]
