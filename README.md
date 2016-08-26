# flac-shibatch-docker
https://lacocina.nl/convert-flac-with-shibatch but dockerize

### Build
```
make
```

### Run
Make sure to put flac files to convert on ~/tmp/flac_files (default location) folder.

```
make run
```
or if you use custom location instead of ~/tmp/flac_files do

```
make FILES=~/flac/files run
```
