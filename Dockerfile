FROM debian:7.8
MAINTAINER DevOps@bq "devops@bq.com"

ENV S3FS_VERSION="1.78"

# Make sure we have S3
WORKDIR /deploy
RUN \
	apt-get update -qq && \
	apt-get install -y build-essential libmount1 libblkid1 libfuse-dev fuse-utils libcurl4-openssl-dev libxml2-dev mime-support automake libtool wget tar && \
	wget https://github.com/s3fs-fuse/s3fs-fuse/archive/v$S3FS_VERSION.tar.gz && \
	tar xvzf v$S3FS_VERSION.tar.gz && \
	cd s3fs-fuse-$S3FS_VERSION && \
	./autogen.sh && \
	./configure --prefix=/usr && \
	make && \
	make install && \
	apt-get remove -y --purge --force-yes build-essential libfuse-dev libcurl4-openssl-dev libxml2-dev mime-support automake libtool wget && \
	apt-get autoremove -y --force-yes && \
	apt-get install -y libcurl3 libxml2 && \
	rm -rf /deploy

WORKDIR /

RUN \
	mkdir /s3fsfolder && \
	touch /tmp/keepup

VOLUME /s3fsfolder

COPY s3fs-config.sh /usr/local/bin/s3fs-config.sh

CMD ["/bin/bash", "/usr/local/bin/s3fs-config.sh"]
