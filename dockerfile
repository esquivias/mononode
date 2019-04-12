FROM ubuntu:18.04
MAINTAINER Daniel Esquivias <daniel.esquivias@gmail.com>
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y build-essential ca-certificates curl git gnupg
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update -y && apt-get upgrade
RUN apt-get install -y mono-complete
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
VOLUME ["/workdirectory"]
WORKDIR /workdirectory
ENTRYPOINT /bin/bash