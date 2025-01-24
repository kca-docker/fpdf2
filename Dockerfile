ARG IMAGE=python:3.12-alpine
ARG BASEFOLDER=/opt
ARG APP=fpdf2
ARG APPFOLDER=${BASEFOLDER}/${APP}




FROM ${IMAGE}
ARG APPFOLDER

WORKDIR ${APPFOLDER}

RUN apk add --update --no-cache --virtual .tmp \  # Install virual package for pip install
      gcc \
      jpeg-dev \
      libc-dev \
      linux-headers \
      zlib-dev \
&&  apk add libjpeg \                              # Install required package(s)
&&  pip install --no-cache -r requirements.txt \   # Install pip package(s) by requirements.txt
&&  apk del .tmp \                                 # Remove virtual package
&&  rm requirements.txt                            # Remove requirements.txt

## Copy template script(s) to image 
COPY *.py .

## Define entrypoint with default arg: python example.py
ENTRYPOINT ["python"]
CMD ["example.py"]
