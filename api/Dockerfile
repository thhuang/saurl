FROM python:3.6
LABEL maintainer="thhuang@caealumni.ce.ntu.edu.tw"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000
ENTRYPOINT ["sh", "docker-entrypoint.sh"]
