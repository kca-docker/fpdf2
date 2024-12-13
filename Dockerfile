ARG IMAGE=python:3-alpine
ARG BASEFOLDER=/usr/src
ARG APP=fpdf2
ARG APPFOLDER=${BASEFOLDER}/${APPFOLDER}




FROM python:3 AS builder
ARG BASEFOLDER
ARG APP
ARG APPFOLDER

WORKDIR ${BASEFOLDER}

RUN python -m ensurepip --upgrade
RUN python -m venv ${APP}

COPY requirements.txt .

RUN source ${APPFOLDER}/bin/activate
RUN pip install -r requirements.txt




FROM ${IMAGE}
ARG BASEFOLDER
ARG APPFOLDER

COPY --from=builder ${APPFOLDER} ${BASEFOLDER}

WORKDIR ${APPFOLDER}

COPY *.py .

CMD [ "python", "bin/python run.py" ]