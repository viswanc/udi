# Utils Docker Image - An image to help with debugging.

FROM alpine

RUN apk update
RUN apk add curl \
	bind-tools \
	postgresql-client \
	jq \
	docker \
	busybox-extras \
	mysql-client \
	redis \
	python-dev \
	py-pip \
	gcc \
	linux-headers \
	musl-dev \
	postgresql-dev

RUN pip install --upgrade pip
RUN pip install boom # For stress testing.

# #Note: Though the build dependencies (like linux-headers) could be removed, to save space. They aren't removed, so to allow for run-time installation of python libraries.

CMD while true; do sleep 1000; done # Prevent the container from exiting.
