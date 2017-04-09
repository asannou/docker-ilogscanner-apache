```
# docker run -it --rm -v /var/run/docker.sock:/docker.sock \
asannou/docker-build:run -it --rm -v $(pwd):/wd -- asannou/ilogscanner-apache:build
```
