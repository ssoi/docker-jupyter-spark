# Jupyter-Scala and Spark on Docker
Jupyter very kindly provides a
[docker image](https://github.com/jupyter/docker-stacks/tree/master/all-spark-notebook) to run
Spark and [Apache Toree](https://toree.incubator.apache.org/) in a notebook environment.
However, instead of using the Toree kernel, I wanted to run
[Jupyter-Scala](https://github.com/alexarchambault/jupyter-scala/tree/topic/spark-example).
Building off this  [image](https://github.com/jupyter/docker-stacks/tree/master/pyspark-notebook)
and the  [instructions](https://github.com/alexarchambault/jupyter-scala/tree/topic/update-readme)
to install Jupyter-Scala, I created a Dockerfile to build an image with my kernel of choice.

To install first get this repo: `git clone https://github.com/ssoi/docker-jupyter-spark.git`.

Build the image: `cd docker-jupyter-spark && docker build -t jupyter-spark .`
By running `docker images`, you should be able to identify the CONTAINER ID.

To run it: `docker run -d -p 8888:8888 <CONTAINER_ID>`.

Point your favorite browser to `localhost:8888` and create a Scala 2.11 notebook.

In th `examples/` folder I have started with a simple Spark example for calculating pi in parallel.

I hope to be soon adding an example utilizing [Bokeh](http://bokeh.pydata.org/en/latest/) with
[Scala bindings](http://nbviewer.jupyter.org/urls/gist.githubusercontent.com/chilang/b28319c2955d76219001/raw/645d4df74186548752a43f93eec3880e4e0d27d1/Bokeh.ipynb).
