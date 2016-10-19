Docker machine learning tools
=============================

[![Docker Stars](https://img.shields.io/docker/stars/pavlov99/ml.svg)](https://hub.docker.com/r/pavlov99/ml/)
[![Docker Pulls](https://img.shields.io/docker/pulls/pavlov99/ml.svg)](https://hub.docker.com/r/pavlov99/ml/)

Based on Ubuntu Linux 16.04, uses python 3.5 and machine learning libraries.

Docker Hub: https://hub.docker.com/r/pavlov99/ml/
GitHub: https://github.com/pavlov99/docker-ml

Pull Docker image:

    docker pull pavlov99/ml

Run its IPython notebook:

    mkdir $(pwd)/data-science-notebooks && docker run -v $(pwd)/data-science-notebooks:/notebooks -p 8888:8888 -it --rm pavlov99/ml jupyter-notebook --ip=0.0.0.0 --no-browser
