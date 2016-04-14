FROM jupyter/minimal-notebook

USER root

# Install pre-requisites
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
      libcurl3 \
      curl \
      imagemagick \
      libmagick++-dev \
      libmagic-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install JVM
ENV APACHE_SPARK_VERSION 1.6.0
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends openjdk-7-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install sbt
RUN echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list && \
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 && \
    sudo apt-get -y update && \
    sudo apt-get install -y --no-install-recommends sbt

# Download Spark
RUN cd /tmp && \
    curl -L -O http://d3kbcqa49mib13.cloudfront.net/spark-${APACHE_SPARK_VERSION}-bin-without-hadoop.tgz && \
    tar xzf spark-${APACHE_SPARK_VERSION}-bin-without-hadoop.tgz -C /usr/local && \
    rm spark-${APACHE_SPARK_VERSION}-bin-without-hadoop.tgz
RUN cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-bin-without-hadoop spark

# Install node and lightning-server
RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
      sqlite3 \
      nodejs-legacy \
      npm && \
    rm -rf /var/lib/apt/lists/*;
RUN npm install -g lightning-server

USER jovyan

# Download and publish lightning-scala to local repo
RUN curl -L -O https://github.com/lightning-viz/lightning-scala/archive/master.zip && \
    unzip master.zip
RUN cd lightning-scala-master && \
    sbt publish-local

# Install jupyter-scala
RUN curl -L -o jupyter-scala https://git.io/vzhRi && \
    sh jupyter-scala && \
    rm -f jupyter-scala
