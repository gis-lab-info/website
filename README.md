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

or with includes and everything

Linux:

```
$ sudo apt install php-cgi php-xml
$ python3 -m venv env
$ source env/bin/activate
$ pip install bottle eventlet
$ ./ssi-server --skip-missing
```

Windows (cmd):

download and unpack PHP: https://windows.php.net/download/

```
c:\Python39\Scripts\pip install virtualenv
c:\Python39\Scripts\virtualenv.exe -p python2 env
env\Scripts\activate
set path=%path%;c:\tools\php
pip install bottle eventlet
python ssi-server --skip-missing
```
