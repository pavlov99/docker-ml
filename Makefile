build:
	docker build -t pavlov99/ml --force-rm .

run:
	docker run -it --rm pavlov99/ml /bin/sh

notebook:
	docker run -p 8888:8888 -it --rm pavlov99/ml /env/bin/jupyter-notebook --ip=0.0.0.0 --no-browser
