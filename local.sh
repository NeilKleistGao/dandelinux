if [ ! -d "output" ];then
  mkdir output
fi

docker build -t dandelinux .
docker run --rm --privileged=true --mount type=bind,source=$(pwd)/output,target=/home dandelinux
