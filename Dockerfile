FROM jupyter/minimal-notebook

USER root

# Install curl
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends libcurl3 curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install JVM
ENV APACHE_SPARK_VERSION 1.6.0
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends openjdk-7-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download Spark
RUN cd /tmp && \
    curl -L -O http://d3kbcqa49mib13.cloudfront.net/spark-${APACHE_SPARK_VERSION}-bin-without-hadoop.tgz && \
    tar xzf spark-${APACHE_SPARK_VERSION}-bin-without-hadoop.tgz -C /usr/local && \
    rm spark-${APACHE_SPARK_VERSION}-bin-without-hadoop.tgz
RUN cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-bin-without-hadoop spark

USER jovyan

# Install jupyter-scala
RUN curl -L -o jupyter-scala https://git.io/vzhRi && \
    sh jupyter-scala && \
    rm -f jupyter-scala
