cat extensions.x86_64 | while read line
do
  if [[ $line == \#* ]]
  then
    echo $line
  else
    echo "installing" $line
    code --install-extension $line
  fi
done
