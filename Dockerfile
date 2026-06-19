FROM ubuntu:22.04

RUN apt-get update && apt-get install -y ffmpeg bash

CMD bash -c '
cat > playlist.txt << EOF
https://server8.mp3quran.net/lhdan/001.mp3
https://server8.mp3quran.net/lhdan/002.mp3
https://server8.mp3quran.net/lhdan/003.mp3
https://server8.mp3quran.net/lhdan/004.mp3
https://server8.mp3quran.net/lhdan/005.mp3
EOF

while read url
do
  ffmpeg -re -i "$url" \
    -vn -c:a aac -b:a 128k \
    -f flv "$RTMP_URL"
done < playlist.txt
'
