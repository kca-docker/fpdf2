ARG IMAGE=python:3-alpine
ARG BASEFOLDER=/usr/src
ARG APP=fptf2
ARG APPFOLDER=${BASEFOLDER}/${APPFOLDER}




FROM ${IMAGE} AS BUILDER
ARG BASEFOLDER
ARG APP

WORKDIR ${BASEFOLDER}

RUN apk add --update \
    gcc \
    musl-dev \
    linux-headers

RUN python -m ensurepip --upgrade
RUN python -m venv ${APP}

COPY requirements.txt .

RUN source ${APP}/bin/activate
RUN pip install wheel && pip wheel .
RUN pip install -r requirements.txt




FROM ${IMAGE}
ARG BASEFOLDER
ARG APPFOLDER

COPY --from=BUILDER ${APPFOLDER} ${BASEFOLDER}

WORKDIR ${APPFOLDER}

COPY *.py .

CMD [ "python", "./run.py" ]
