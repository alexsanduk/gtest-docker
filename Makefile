build:
	docker build -f Dockerfile -t alexsanduk/gtest-docker:test .

test:
	docker run --rm -it alexsanduk/gtest-docker:test make check
