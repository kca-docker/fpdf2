FROM python:3-slim

WORKDIR /usr/src/fpdf

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY *.py .

CMD [ "python", "./run.py" ]