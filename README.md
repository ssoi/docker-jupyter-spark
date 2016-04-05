# Jupyter-Scala and Spark on docker
Jupyter very kindly provides a docker image to run Spark and Apache Toree in a notebook environment.
However, instead of using the Toree kernel, I wanted to run Jupyter-Scala. Building of this image
and the instructions to install Jupyter-Scala, I created a Dockerfile to build an image with my
kernel of choice.

To install first get this repo: `git clone https://github.com/ssoi/docker-jupyter-spark.git`.

Build the image: `cd docker-jupyter-spark && docker build -t jupyter-spark .`
By running `docker images`, you should be able to identify the CONTAINER ID.

To run it: `docker run -d -p 8888:8888 <CONTAINER_ID>`.

Point your favorite browser to `localhost:8888` and create a Scala 2.11 notebook.
