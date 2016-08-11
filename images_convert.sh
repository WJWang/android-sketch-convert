#! /bin/bash
echo "==================================================================="
echo "============STATR TO CONVERT iOS images to Android================="
echo "==================================================================="


INPUTPATH=./*.png

# @1x
rm -rf ./mdpi
mkdir ./mdpi
# @2x
rm -rf ./xhdpi
mkdir ./xhdpi
# @3x
rm -rf ./xxhdpi
mkdir ./xxhdpi

for f in $INPUTPATH
do
  # echo $f
  fLength=${#f}
  fileName=${f:2:$fLength-6}
  new=$(echo "$fileName" | tr -s '\011' ' ' | tr -s ' ' '_' | tr -s '.' '_' | tr '[A-Z]' '[a-z]')
  newLength=${#new}
  mv "./$fileName.png" "./$new.png"

  if [ -f $f ]
  then
    if [[ $new == *"@2x" ]]; then
      newIn2x=${new:0:$newLength-3}
      cp "./$new.png" "./xhdpi/$newIn2x.png"
    elif [[ $new == *"@3x" ]]; then
      newIn3x=${new:0:$newLength-3}
      cp "./$new.png" "./xxhdpi/$newIn3x.png"
    else
      cp "./$new.png" "./mdpi/$new.png"
    fi
  else
    echo "'$f' is not a valid file!"
  fi
done

echo "==================================================================="
echo "==============================END=================================="
echo "==================================================================="
