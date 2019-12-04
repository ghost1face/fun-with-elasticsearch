#!/bin/sh

BASEDIR=$(dirname "$0")
curl -XDELETE 'localhost:9200/employee'
curl -XPUT 'localhost:9200/employee?pretty' -H 'Content-Type: application/json' -d'{
  "mappings": {
    "properties": {
      "firstName": {
        "type": "text"
      },
      "lastName": {
        "type": "text"
      },
      "designation": {
        "type": "text"
      },
      "salary": {
        "type": "integer"
      },
      "dateOfJoining": {
        "type": "date",
        "format": "yyyy-MM-dd"
      },
      "address": {
        "type": "text"
      },
      "gender": {
        "type": "text"
      },
      "age": {
        "type": "integer"
      },
      "maritalStatus": {
        "type": "text"
      },
      "interests": {
        "type": "text"
      }
    }
  }
}'
curl -XPUT 'localhost:9200/employee/_bulk' -H 'Content-Type: application/x-ndjson' --data-binary "@$BASEDIR/employees.json"