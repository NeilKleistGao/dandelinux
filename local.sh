if [ ! -d "output" ];then
  mkdir output
fi

docker build -t dandelinux .
docker run --rm --privileged=true -v $(pwd)/output:/output -v $(pwd)/dandelinux:/dandelinux dandelinux
