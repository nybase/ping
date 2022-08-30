
FROM alpine:latest

ENV TZ=Asia/Shanghai LANG=C.UTF-8


# yum only: yum-utils createrepo crontabs curl-minimal dejavu-sans-fonts iproute java-11-openjdk-devel java-17-openjdk-devel telnet traceroute pcre-devel pcre2-devel 
# alpine: openjdk8 openjdk11-jdk openjdk17-jdk font-noto-cjk consul vim openjdk11-jdk openjdk17-jdk 
RUN set -eux; addgroup -g 8080 app ; adduser -u 8080 -S -G app app ;\
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories ;\
    apk add --no-cache bash busybox-extras ca-certificates curl wget iproute2 runit dumb-init gnupg libcap openssl su-exec iputils jq libc6-compat iptables tzdata \
        procps  iputils  tzdata less   unzip  tcpdump tshark net-tools socat jq mtr psmisc logrotate  tomcat-native \
        runit pcre-dev pcre2-dev  openssh-client-default  luajit luarocks iperf3 wrk atop htop iftop \
        consul consul-template vim 
