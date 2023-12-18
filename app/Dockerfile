FROM python:3.11

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=database


COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . app
WORKDIR app

CMD ["python", "main.py"]