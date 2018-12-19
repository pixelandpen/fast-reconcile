FROM python:3.7

RUN useradd -d /home/flaskapp flaskapp

#RUN apt-get update && apt-get upgrade -y

WORKDIR /home/flaskapp

COPY requirements.txt requirements.txt
COPY reconcile.py reconcile.py
COPY text.py text.py

RUN pip install -r requirements.txt

ENV FLASK_APP reconcile.py

RUN chown -R flaskapp:flaskapp ./

USER flaskapp

EXPOSE 5000

ENTRYPOINT ["python"]

CMD ["reconcile.py"]
