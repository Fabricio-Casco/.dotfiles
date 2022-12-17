
while [ $# -gt 0 ] ; do
  case $1 in
    -s | --state) S="$2" ; shift ;;
    -u | --user) U="$2" ; shift ;;
    -a | --aarg) A="$2" ; shift ;;
    -b | --barg) B="$2" ; shift ;;
    *) echo "Unknown argument '$1'."; exit 1 ;;

  esac
  shift
done

echo $S $U, $A $B

test_func() {
  echo "yay"
}

# S=test_func
# $S

exit 0
