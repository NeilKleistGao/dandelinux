pacman -Syu
cat pacman.x86_64 | while read line
do
  if [[ $line == \#* ]]
  then
    echo $line
  else
    echo "installing" $line
    pacstrap /mnt $line
  fi
done

cat yay.x86_64 | while read line
do
  if [[ $line == \#* ]]
  then
    echo $line
  else
    echo "installing" $line
    yay -S $line --noconfirm
  fi
done