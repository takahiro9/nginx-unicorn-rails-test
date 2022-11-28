request () {
  local requestId=$1
  local url=${2-"http://localhost"}
  local startTime=`gdate +%s%3N`
  curl $url -x localhost:8888 > /dev/null 2>&1
  local endTime=`gdate +%s%3N`
  elapsedTime=`echo $(($endTime - $startTime))`
  echo "request $requestId は $elapsedTime ms かかりました"
}
export -f request