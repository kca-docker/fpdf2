ARG IMAGE=python:3-alpine
ARG BASEFOLDER=/opt
ARG APP=fpdf2
ARG APPFOLDER=${BASEFOLDER}/${APP}




FROM ${IMAGE} AS builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt




FROM ${IMAGE}
ARG APPFOLDER

WORKDIR ${APPFOLDER}

COPY --from=builder /app/wheels /wheels

RUN pip install --no-cache /wheels/* -r requirements

COPY *.py .

ENTRYPOINT [ "python"]
CMD ["run.py"]