# website
gis-lab.info


# dev
```
$ git clone https://github.com/gis-lab-info/website.git
$ cd website
```

There are 2 ways to run the development server:


```
$ python -m http.server
```

or

```
$ virtualenv -p python2 env
$ source env/bin/activate
$ pip install bottle eventlet
$ ./ssi-server --skip-missing
```
