FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN info_hub_svc create-db
RUN info_hub_svc populate-db
RUN info_hub_svc add-user -u admin -p admin
EXPOSE 5000
CMD ["info_hub_svc", "run"]
