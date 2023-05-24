FROM python:3.10-alpine

ENV PORT_NUMBER=5000
ENV WORK_ENV=/app

# Create app directory
WORKDIR ${WORK_ENV}

# Install app dependencies
RUN pip install flask flask_cors

COPY templates/ ${WORK_ENV}/templates/
COPY app.py ${WORK_ENV}/


CMD flask run --host=0.0.0.0 --port=${PORT_NUMBER}
