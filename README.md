# ssrc-docker
https://lacocina.nl/convert-flac-with-shibatch but dockerize

### Build
```
docker build --rm -t nandub/flac-conv .
```

### Run
Make sure to put flac files to convert on a folder, ~/tmp/flac_files

```
docker run --rm -v ~/tmp/flac_files:/flac/files -h=flac-conv --name=flac-conv nandub/flac-conv
```
