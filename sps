# search for the jar file relative to this script
fname="/spsauce/SPSauce-*.jar"

# run the jar file from the spsauce directory
if [[ ! -f $fname ]]; then
  echo 'Could not find any SPSauce jar binary'
  exit 1
fi

java -jar $fname $@
