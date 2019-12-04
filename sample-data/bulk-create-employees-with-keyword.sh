#!/bin/sh

curl -XDELETE 'localhost:9200/employee_with_keyword'
curl -XPUT 'localhost:9200/employee_with_keyword?pretty' -H 'Content-Type: application/json' -d'{
  "mappings": {
    "properties": {
      "firstName": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "ignore_above": 256
          }
        }
      },
      "lastName": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "ignore_above": 256
          }
        }
      },
      "designation": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "ignore_above": 256
          }
        }
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
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "ignore_above": 256
          }
        }
      },
      "age": {
        "type": "integer"
      },
      "maritalStatus": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "ignore_above": 256
          }
        }
      },
      "interests": {
        "type": "text"
      }
    }
  }
}'
curl -XPOST 'localhost:9200/_reindex' -H 'Content-Type: application/json' -d'{
  "source": {
    "index": "employee"
  },
  "dest": {
    "index": "employee_with_keyword"
  }
}'