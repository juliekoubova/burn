# Burning Man Camp Registration

### Overview

This Rails app is used to power our camps registration system at [burn.8bitbunny.com](https://burn.8bitbunny.com/). Our goal is to test it in 2022 and then roll it out as a SasS product for 2023.

### Start

```
$ foreman start
```

### Deploy

```
$ git push heroku
```

### Install Dependencies

```
# macOS
$ brew install rbenv vips postgresql
```

### Run in Docker
```
$ docker build -t burn .
$ docker run --rm -p 5050:5050 burn
```