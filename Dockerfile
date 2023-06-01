FROM archlinux:base-20230514.0.150299
COPY build.sh /build.sh

ENTRYPOINT ["/build.sh"]
