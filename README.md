```
$ sudo docker volume create ilogscanner
$ sudo docker run -it --rm -v ilogscanner:/jar -v $(pwd):/wd asannou/ilogscanner-apache access_log
```
