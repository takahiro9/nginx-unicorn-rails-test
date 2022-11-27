source `dirname $0`/request.sh
seq 1 10 | xargs -I ZZ -P 10 bash -c 'request ZZ localhost:80/sleep/seconds/1'