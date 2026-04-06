FROM telegrammessenger/proxy:latest

# إنشاء الملفات المطلوبة يدوياً لتجنب مشاكل المستودعات القديمة
RUN echo "95.161.222.186:443" > /etc/proxy-multi.conf && \
    echo "91.108.56.163:443" >> /etc/proxy-multi.conf && \
    echo "91.108.56.156:443" >> /etc/proxy-multi.conf && \
    echo "149.154.175.50:443" >> /etc/proxy-multi.conf && \
    head -c 16 /dev/urandom > /etc/proxy-secret

ENV PORT=8080
EXPOSE 8080

# تشغيل المحرك بالإعدادات المباشرة
CMD ["/bin/sh", "-c", "mtproto-proxy -u nobody -p 8888 -H $PORT -S $SECRET -P $AD_TAG --aes-pwd /etc/proxy-secret /etc/proxy-multi.conf"]
