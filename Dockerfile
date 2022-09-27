FROM python:3.10.7

ENV PYTHONUNBUFFERED 1

WORKDIR /myapp
RUN pip install --upgrade pip --no-cache-dir
COPY requirements.txt requirements.txt 
RUN pip install -r requirements.txt
COPY . .


#CMD python myapp/manage.py runserver 0.0.0.0:8000
CMD ["waitress-serve","--listen=*:8000","myapp.wsgi:application"]
