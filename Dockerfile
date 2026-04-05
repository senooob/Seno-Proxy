FROM telegrammessenger/proxy:latest
ENV PORT=8080
EXPOSE 8080
# إضافة أمر تحميل ملف سيرفرات تلغرام قبل التشغيل
RUN apt-get update && apt-get install -y curl && \
    curl -s https://core.telegram.org/getProxyConfig -o /etc/proxy-multi.conf
    
CMD ["/bin/sh", "-c", "mtproto-proxy -u nobody -p 8888 -H $PORT -S $SECRET -P $AD_TAG --aes-pwd /etc/proxy-secret /etc/proxy-multi.conf"]
