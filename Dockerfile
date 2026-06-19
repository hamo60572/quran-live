FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y ffmpeg bash

CMD bash -c '
echo "QURAN LOOP STARTED"

while true
do
  for i in $(seq -f "%03g" 1 114)
  do
    echo "Playing Surah $i"

    ffmpeg -nostdin -re \
      -i "https://server8.mp3quran.net/lhdan/${i}.mp3" \
      -vn \
      -c:a aac \
      -b:a 128k \
      -f flv "$RTMP_URL" || true

    echo "Finished Surah $i"
    sleep 1
  done

  echo "Finished Quran - restarting from Al-Fatihah"
done
'
