request () {
  local requestId=$1
  local url=${2-"http://localhost"}
  local startTime=`gdate +%S%3N`
  curl $url > /dev/null 2>&1
  local endTime=`gdate +%S%3N`
  elapsedTime=`echo $(($endTime - $startTime))`
  echo "request $requestId は $elapsedTime ms かかりました"
}
export -f request