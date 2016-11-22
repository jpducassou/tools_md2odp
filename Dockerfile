FROM debian:8.5

ENV DEBIAN_FRONTEND noninteractive

RUN echo "Acquire::Retries 5;" >> /etc/apt/apt.conf
RUN \
	if [ -n $http_proxy ]; then \
		echo "Acquire::https::proxy \"${https_proxy}\";" >> /etc/apt/apt.conf; \
		echo "Acquire::http::proxy  \"${http_proxy}\";"  >> /etc/apt/apt.conf; \
	fi

RUN apt-get clean \
	&& apt-get update \
	&& apt-get install -yqV --no-install-recommends \
		git python python-pip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install virtualenv
RUN virtualenv env
RUN bash -c "source env/bin/activate && pip install mistune pygments pillow lxml"
RUN bash -c "source env/bin/activate && pip install https://github.com/lpod/lpod-python/archive/master.zip"
RUN bash -c "source env/bin/activate && pip install https://github.com/thorstenb/odpdown/archive/master.zip"

COPY templates/ /tmp/templates/

CMD "odpdown"

