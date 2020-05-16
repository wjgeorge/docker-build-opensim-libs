PLATFORM=--platform linux/arm/v7
all: build run


build:
	docker buildx build . $PLATFORM -t opensim-libs
run:
	docker run -it --rm $PLATFORM opensim-libs bash; exit 0
