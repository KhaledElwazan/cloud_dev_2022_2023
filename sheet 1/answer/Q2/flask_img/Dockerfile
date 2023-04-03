FROM python

ENV ROOT_DIR /app

ENV PORT 5000

RUN pip install flask

COPY . .

WORKDIR $ROOT_DIR

EXPOSE $PORT

CMD flask run --host=0.0.0.0 --port=$PORT