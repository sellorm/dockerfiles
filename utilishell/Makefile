# Build the utilishell docker image
.PHONY : all
all : docker-build.log

docker-build.log : Dockerfile
	docker build --rm -t="sellorm/utilishell:latest" . > docker-build.log

.PHONY : clean
clean :
	rm docker-build.log
