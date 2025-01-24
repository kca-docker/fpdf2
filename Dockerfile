ARG IMAGE=python:3-alpine
ARG BASEFOLDER=/opt
ARG APP=fpdf2
ARG APPFOLDER=${BASEFOLDER}/${APP}




FROM ${IMAGE} AS builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip Pillow

COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /wheels -r requirements.txt




FROM ${IMAGE}
ARG APPFOLDER

WORKDIR ${APPFOLDER}

COPY --from=builder /wheels /wheels
RUN pip install --no-cache --upgrade pip Pillow /wheels/*

COPY *.py .

ENTRYPOINT [ "python"]
CMD ["run.py"]
