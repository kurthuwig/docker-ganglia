Supported tags and respective `Dockerfile` links
================================================

 - [`latest` (*latest/Dockerfile*)](https://github.com/kurthuwig/docker-ganglia/blob/master/Dockerfile)

What is ganglia?
================

[Ganglia](http://ganglia.info/) is a scalable distributed monitoring system for high-performance computing systems such as clusters and Grids. It is based on a hierarchical design targeted at federations of clusters. It leverages widely used technologies such as XML for data representation, XDR for compact, portable data transport, and RRDtool for data storage and visualization. It uses carefully engineered data structures and algorithms to achieve very low per-node overheads and high concurrency. The implementation is robust, has been ported to an extensive set of operating systems and processor architectures, and is currently in use on thousands of clusters around the world. It has been used to link clusters across university campuses and around the world and can scale to handle clusters with 2000 nodes.

Installation
============

This docker image needs a persistent storage to store its configuration and data.
The corresponding docker command would be

    docker run \
      -d \
      -v /path_to_directory/etc:/etc/ganglia \
      -v /path_to_directory/data:/var/lib/ganglia \
      -p 127.0.0.1:80:80 \
      -p 8649:8649 \
      -p 8649:8649/udp \
      kurthuwig/ganglia:latest

and the corresponding [docker-compose](http://docs.docker.com/compose/) (or [fig](http://www.fig.sh/)) file would be

    ganglia:
      image: kurthuwig/ganglia:latest
      ports:
       - "127.0.0.1:80:80"
       - "8649:8649"
       - "8649:8649/udp"
      volumes:
       - /path_to_directory/etc:/etc/ganglia
       - /path_to_directory/data:/var/lib/ganglia

If the `etc` directory does not contain a configuration, a default configuration will be created.

Accessing the web GUI
=====================

After launch the web GUI is available at

http://localhost/ganglia/

If you want to access it from the outside, you have to change the `127.0.0.1` to `0.0.0.0` or the IP that you want it to appear on.
If you want to have it on another port, in the same line change the `80` to the desired port, e.g.

    -p 127.0.0.1:8888:80 \

Environment variables
=====================

The container uses no environment variables

Contact
=======

Kurt Huwig (@GMail.com: kurthuwig)
