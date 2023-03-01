function log() {
  level="$1"
  message="$2"
  color=""
  symbol=""
  case "$level" in
    "success" ) color="${Green}" ; symbol="+" ;;
    "question" ) color="${Purple}" ; symbol="?" ;;
    "err" ) color="${Red}" ; symbol="-" ;;
    "warn" ) color="${Yellow}" ; symbol="!" ;;
    "info" ) color="${Blue}" ; symbol="+" ;;
    "null" ) echo "$message" ; return 0 ;;
  esac
  
  echo -e "${color}[${symbol}]${Nocolor} $message"
}
