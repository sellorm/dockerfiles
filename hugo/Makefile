# Build the hugo docker image
.PHONY : all
all : docker-build.log

docker-build.log : Dockerfile
	docker build --rm -t="sellorm/hugo:latest" . > docker-build.log

.PHONY : clean
clean :
	rm docker-build.log
