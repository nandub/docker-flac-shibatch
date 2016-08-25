FILES = ~/tmp/flac_files

build:
	@echo Building image
	@docker build --rm -t nandub/flac-conv .

run:
	@echo Converting files from $(FILES)
	@docker run --rm -v $(FILES):/flac/files nandub/flac-conv /flac/files

.PHONE: build
