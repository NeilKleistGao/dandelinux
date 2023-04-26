if not exist output md output

docker build -t dandelinux .
docker run --rm --privileged=true -v %~dp0/output:/output -v %~dp0/dandelinux:/dandelinux dandelinux
