FROM telegrammessenger/proxy:latest
ENV PORT=8080
EXPOSE 8080
# التعديل هنا: استخدام الأمر مباشرة دون تحديد مسار مجلد usr
CMD ["/bin/sh", "-c", "mtproto-proxy -u nobody -p 8888 -H $PORT -S $SECRET -P $AD_TAG --aes-pwd /etc/proxy-secret /etc/proxy-multi.conf"]
