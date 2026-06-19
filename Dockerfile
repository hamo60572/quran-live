FROM ubuntu:22.04

RUN apt-get update && apt-get install -y ffmpeg bash

CMD bash -c '
while true
do
  for url in \
    https://server8.mp3quran.net/lhdan/001.mp3 \
    https://server8.mp3quran.net/lhdan/002.mp3 \
    https://server8.mp3quran.net/lhdan/003.mp3 \
    https://server8.mp3quran.net/lhdan/004.mp3 \
    https://server8.mp3quran.net/lhdan/005.mp3
  do
    echo "NOW PLAYING: $url"

    ffmpeg -re -i "$url" \
      -vn \
      -c:a aac \
      -b:a 128k \
      -f flv "$RTMP_URL"

    echo "DONE: $url"
  done
done
'
