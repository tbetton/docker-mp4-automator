FROM python:2.7-stretch

RUN mkdir /data

# install ffmpeg
RUN apt-get update -qq && apt-get install python-pip ffmpeg -y -qq

RUN pip install requests requests[security] requests-cache babelfish "guessit<2" stevedore==1.19.1 python-dateutil qtfaststart
RUN git clone https://github.com/mdhiggins/sickbeard_mp4_automator /app
WORKDIR /app
# Copy local config file
COPY autoProcess.ini .

ENTRYPOINT ["/app/manual.py", "-i", "/data/", "-a"]
