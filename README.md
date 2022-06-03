## Usage

Build the image
```
./build.sh
```

For one file
```
docker run -ti --rm -v $(pwd):/opt perltidy perltidy.sh file.pm
```

For multiple files
```
docker run -ti --rm -v $(pwd):/opt perltidy perltidy.sh *.pm
```
