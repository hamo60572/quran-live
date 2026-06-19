FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y ffmpeg curl bash

ENV RTMP_URL=""

CMD bash -c '
echo "START STREAM"

while true
do
  ffmpeg -re \
    -i "https://server8.mp3quran.net/lhdan/001.mp3" \
    -vn \
    -c:a aac \
    -b:a 128k \
    -f flv "$RTMP_URL"

  echo "RESTARTING STREAM"
  sleep 2
done
'
