FROM nginx:1.15.5
MAINTAINER shree dee <dee@labizbille.com>

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		iputils-ping python3 python-pip python-setuptools unzip\
	&& rm -rf /var/lib/apt/lists/* \
	&& pip install awscli --upgrade

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh


ENTRYPOINT ["/setup.sh"]
#CMD tail -f /dev/null

