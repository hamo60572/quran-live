FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl

CMD bash -c '
for i in $(seq -f "%03g" 1 10)
do
  echo "CHECKING $i"
  curl -I "https://server8.mp3quran.net/lhdan/${i}.mp3"
done

sleep 600
'
