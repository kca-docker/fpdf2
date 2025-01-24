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




FROM ${IMAGE}
ARG APPFOLDER

WORKDIR ${APPFOLDER}

RUN apk add --no-cache py3-pillow

#COPY --from=builder /wheels /wheels
#RUN pip install --no-cache /wheels/*
RUN pip install --no-cache -r requirements.txt

COPY *.py .

ENTRYPOINT [ "python"]
CMD ["example.py"]
