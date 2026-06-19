FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y ffmpeg bash

CMD bash -c '
while true
do
  for i in $(seq -f "%03g" 1 114)
  do
    echo "Playing Surah $i"

    ffmpeg -re \
      -i "https://server8.mp3quran.net/lhdan/${i}.mp3" \
      -vn \
      -c:a aac \
      -b:a 128k \
      -f flv "$RTMP_URL"

  done
done
'
