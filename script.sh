#/bin/bash

start() {
  if test -f result.csv
  then
    rm result.csv
  fi
  
  while true; 
  do
    local cpu_metrics=$(top -l 1 | egrep "CPU usage:" | egrep -o '[0-9]+.[0-9]{2}')
    
    local timestamp=$(date +"%H:%M:%S")
    local result="$timestamp;"
	
    for element in ${cpu_metrics[@]}; do
  	result+="$element;"
    done
 
    echo $result >> result.csv
    sleep 600 
  done &
  echo "working pid: $!"
  echo $! >> pid_info.txt
}


stop() {
  local pid=$(cat pid_info.txt)
  if test -z "$pid" 
  then
    echo "Programm doesn't have working pid"
  else
    kill $pid
    rm pid_info.txt
    echo "Programm stopped"
  fi
}

get_status() {
  local pid=$(cat pid_info.txt)
  if test -z "$pid" 
  then
    echo "Programm doesn't have working pid"
  else
    echo "Programm has an active pid: $pid"
  fi
}

case "$1" in
  "START")
    start
    ;;
  "STOP")
    stop
    ;;
  "STATUS")
    get_status
    ;;
  *)
    echo "Incorrect arguments"
    exit 1
    ;;
esac

