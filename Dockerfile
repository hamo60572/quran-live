FROM ubuntu:22.04

RUN apt-get update && apt-get install -y ffmpeg

CMD ffmpeg -re \
-i "https://serverkw.quran-uni.com:8156/;*.mp3" \
-vn \
-c:a aac \
-b:a 128k \
-f flv "$RTMP_URL"
