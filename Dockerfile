#FROM alpine/git as GIT

#WORKDIR /tmp

#RUN git clone https://github.com/py-pdf/fpdf2.git
#RUN ls -la




FROM python:3-alpine

WORKDIR /usr/src/fpdf

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#COPY --from=GIT /tmp/fpdf2 /tmp/fpdf2
#RUN pip install --no-cache-dir /tmp/fpdf2
#RUN rm -rf /tmp/fpdf2
#RUN ls -la /tmp

#RUN pip list
#RUN pip show fpdf2


COPY *.py .

CMD [ "python", "./run.py" ]