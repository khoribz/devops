FROM python:3.11

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . app
WORKDIR app

EXPOSE 8000

CMD ["python", "main.py"]