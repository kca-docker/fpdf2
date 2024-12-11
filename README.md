[![Docker Image Size](https://badgen.net/docker/size/bksolutions/fpdf2?icon=docker&label=image%20size)](https://hub.docker.com/r/bksolutions/fpdf2/)
[![Docker Pulls](https://badgen.net/docker/pulls/bksolutions/fpdf2?icon=docker&label=pulls)](https://hub.docker.com/r/bksolutions/fpdf2/)
[![Docker Stars](https://badgen.net/docker/stars/bksolutions/fpdf2?icon=docker&label=stars)](https://hub.docker.com/r/bksolutions/fpdf2/)
![Github stars](https://badgen.net/github/stars/kca-docker/fpdf2?icon=github&label=stars)
![Github forks](https://badgen.net/github/forks/kca-docker/fpdf2?icon=github&label=forks)
![Github issues](https://img.shields.io/github/issues/kca-docker/fpdf2)
![Github last-commit](https://img.shields.io/github/last-commit/kca-docker/fpdf2)




# fpdf2  <!-- omit in toc -->

# Content  <!-- omit in toc -->

- [Getting Started](#getting-started)
  - [Usage](#usage)
    - [Volume(s)](#volumes)
    - [Description](#description)
  - [Default python script example](#default-python-script-example)
- [Find Us](#find-us)
- [Versioning](#versioning)
- [Authors](#authors)


# Getting Started

These instructions will cover usage information and for the docker container 

## Usage

The image could be started by the following command.  

```shell
$ docker run -d bksolutions/fpdf2
```
```shell
$ docker run -d bksolutions/fpdf2:latest
```

### Volume(s)

* `/usr/src/fpdf` - Working directory

### Description

For own scripted pdf's, the script should be mounted to the container.

```shell
$ docker run -d --rm --name fpdf -v $PWD/<code>:/usr/src/fpdf:rw bksolutions/fpdf2
```
```shell
$ podman run -d --rm --name fpdf -v $PWD/<code>:/usr/src/fpdf:Z bksolutions/fpdf2
```

## Default python script example

```python
##Import(s)
from fpdf import FPDF

## Prepare
pdf = FPDF(format="a4")
pdf.set_font('helvetica', size=12)

##Content
pdf.add_page()
pdf.cell(text="hello world")


##Generate PDF
pdf.output("hello_world.pdf")
```

# Find Us

* [GitHub](https://github.com/kca-docker/fpdf2)

# Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the 
[tags on this repository](https://github.com/kca-docker/fpdf2/tags). 

# Authors

* **Carsten Kruse** - *update* - [C. Kruse](https://github.com/KruseCarsten)

See also the list of [contributors](https://github.com/kca-docker/fpdf2/contributors) who 
participated in this project.