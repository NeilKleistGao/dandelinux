if not exist output md output

docker build -t dandelinux .
docker run --rm --privileged=true --mount type=bind,source=%~dp0/output,target=/home dandelinux
