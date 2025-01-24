ARG IMAGE=python:3-alpine
ARG BASEFOLDER=/opt
ARG APP=fpdf2
ARG APPFOLDER=${BASEFOLDER}/${APP}




#FROM ${IMAGE} AS builder

#WORKDIR /app

#ENV PYTHONDONTWRITEBYTECODE 1
#ENV PYTHONUNBUFFERED 1

##RUN pip install --upgrade pip

##RUN apk add --no-cache jpeg-dev zlib-dev
##RUN apk add --no-cache --virtual .build-deps build-base linux-headers

#RUN apk add --no-cache py3-pillow

#COPY requirements.txt .
#RUN pip wheel --no-cache-dir --no-deps --wheel-dir /wheels -r requirements.txt

##With in image
#COPY --from=builder /wheels /wheels
#RUN pip install --no-cache /wheels/*




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
&&  pip install --no-cache -r requirements.txt
&&  apk del .tmp \
&&  rm requirements.txt

COPY *.py .

ENTRYPOINT [ "python"]
CMD ["example.py"]
