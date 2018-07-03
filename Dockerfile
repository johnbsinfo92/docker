#JENKINS
  FROM jenkins/jenkins:lts
  USER root

#ADD BASELINE jenkins_home FOLDER
#ADD ./jenkins_home /var/jenkins_home

  RUN apt-get update
  RUN apt-get install -y apt-utils
  RUN apt-get install -y sudo
  RUN apt-get install -y curl
  RUN rm -rf /var/lib/apt/lists/*

#==============================
#INSTALL NODE
#==============================
  RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  RUN apt-get install -y nodejs
  RUN apt-get install -y nano

#==============================
# Google Chrome Stable - Latest
#==============================
  RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
        | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" \
        > /etc/apt/sources.list.d/google.list \
  && apt-get -qy update \
  && apt-get -qy install -y google-chrome-stable \
  && apt-get -qyy autoremove \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get -qyy clean \
  && echo google-chrome-stable --version

#==============================
# selenium-standalone
#==============================
  RUN npm install selenium-standalone@latest -g
  RUN selenium-standalone install
