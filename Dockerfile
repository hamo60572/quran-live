FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y ffmpeg curl

ENV RTMP_URL=""

CMD ffmpeg -re \
-i "https://server8.mp3quran.net/lhdan/001.mp3" \
-vn \
-c:a aac \
-b:a 128k \
-f flv "$RTMP_URL"
