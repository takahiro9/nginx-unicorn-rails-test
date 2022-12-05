request () {
  local requestId=$1
  local url=${2-"http://localhost"}
  local proxy=${3}
  local startTime=`gdate +%s%3N`
  if [ -n "$proxy" ]; then
    curl $url -x localhost:8888 > /dev/null 2>&1
  else
    curl $url > /dev/null 2>&1
  fi
  local endTime=`gdate +%s%3N`
  local elapsedTime=`echo $(($endTime - $startTime))`
  echo "request $requestId は $elapsedTime ms かかりました"
}
export -f request