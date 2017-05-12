FILES = ~/tmp/flac_files

build:
	@echo Building image
	@docker build --rm -t nandub/flac-shibatch .

run:
	@echo Converting local files from $(FILES)
	@docker run --rm -v $(FILES):/flac/files nandub/flac-shibatch

.PHONE: build
