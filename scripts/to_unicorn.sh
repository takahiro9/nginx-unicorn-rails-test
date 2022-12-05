source `dirname $0`/request.sh
request slow rails:8080 localhost:3128  &
request normal localhost:8080 &
wait