FROM python:3

# set the working directory in the container to /app
WORKDIR /app

# add the current directory to the container as /app
ADD . /app

RUN python --version
RUN pip --version

RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN pip list

# unblock port 5000 for the Flask app
EXPOSE 5000

# execute the Flask app
CMD ["python", "app.py"]


# docker build -t cjoakim/python-flask-postgresql . 
# docker image ls | grep python-flask-postgresql
# docker run -d -e PORT=5000 -p 5000:5000 cjoakim/python-flask-postgresql:latest
# docker run -d -e PORT=5000 -e AZURE_PSQL_DB_SERVER=$AZURE_PSQL_DB_SERVER -e AZURE_PSQL_DB_PORT=$AZURE_PSQL_DB_PORT -e AZURE_PSQL_DB_SERVER_ADMIN=$AZURE_PSQL_DB_SERVER_ADMIN -e AZURE_PSQL_DB_NAME=$AZURE_PSQL_DB_NAME -e AZURE_PSQL_DB_PASS=$AZURE_PSQL_DB_PASS -e AZURE_PSQL_DB_SSLMODE=$AZURE_PSQL_DB_SSLMODE -p 5000:5000 cjoakim/python-flask-postgresql:latest
# docker stop -t 2 008038664a58
# docker exec -it b23d3ce4b830 /bin/bash
#   @b23d3ce4b830:/app# curl -v http://localhost
#   @b23d3ce4b830:/app# curl -v http://localhost/env
#
# docker push cjoakim/python-flask-postgresql:latest
#
# docker tag cjoakim/python-flask-postgresql:latest cjoakimacr.azurecr.io/python-flask-postgresql:latest
# docker push cjoakimacr.azurecr.io/python-flask-postgresql:latest
#
# az acr login --name cjoakimacr
# az acr repository list --name cjoakimacr --output table
