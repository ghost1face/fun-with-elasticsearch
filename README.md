## WELCOME TO ELASTICSEARCH
### You Know, For Search

#### Getting started

Run docker compose, this will stand up a test instance of ElasticSearch and Kibana tools, connecting on ports `9200` and `5601`:

```docker-compose up```

After this starts up, run the `./sample-data/init.sh` script, this script creates a sample dataset of employees and creates 3 different indices with the same data.