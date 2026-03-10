ARG IMAGE=python:3-alpine
ARG BASEFOLDER=/opt
ARG APP=fpdf2
ARG APPFOLDER=${BASEFOLDER}/${APP}




FROM ${IMAGE}
ARG APPFOLDER

WORKDIR ${APPFOLDER}

COPY requirements.txt .
RUN apk add --update --no-cache --virtual .tmp \
      gcc \
      jpeg-dev \
      libc-dev \
      linux-headers \
      zlib-dev \
&&  apk add libjpeg \
&&  pip install --no-cache -r requirements.txt \
&&  apk del .tmp \
&&  rm requirements.txt

## Copy template script(s) to image 
COPY *.py .

## Define entrypoint with default arg: python example.py
ENTRYPOINT ["python"]
CMD ["example.py"]
