FROM adoptopenjdk:11.0.10_9-jdk-hotspot-focal

ARG IDEA_VERSION=2023.1

RUN  \
  apt-get update && apt-get install --no-install-recommends -y \
  gcc git openssh-client less firefox \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 libgtk2.0-0 libxslt1.1 libxxf86vm1 libxss1

ARG FIREFOX=/usr/lib/firefox/firefox
RUN mv ${FIREFOX} ${FIREFOX}_no_flags \
 && echo "#! /bin/bash" > ${FIREFOX} \
 && echo "${FIREFOX}_no_flags --no-remote \"\$@\"" >> ${FIREFOX} \
 && chmod +x ${FIREFOX}

ARG idea_source=https://download.jetbrains.com/idea/ideaIC-2023.1.tar.gz
ARG idea_local_dir=.IdeaIC${IDEA_VERSION}

RUN mkdir -p /opt/idea
RUN curl -fsSL $idea_source -o /opt/idea/installer.tgz
RUN tar --strip-components=1 -xzf /opt/idea/installer.tgz -C /opt/idea
RUN rm /opt/idea/installer.tgz

RUN mkdir .Idea \
  && ln -sf .Idea $idea_local_dir

CMD [ "/opt/idea/bin/idea.sh" ]
