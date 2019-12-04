#!/bin/sh

curl -XDELETE 'localhost:9200/employee_with_keyword_and_analyzer'
curl -XPUT 'localhost:9200/employee_with_keyword_and_analyzer?pretty' -H 'Content-Type: application/json' -d'{
  "settings": {
    "index": {
      "analysis": {
        "normalizer": {
          "case_insensitive_normalizer": {
            "filter": [
              "lowercase",
              "asciifolding"
            ],
            "type": "custom"
          }
        }
      }
    }
  },
  "mappings": {
    "properties": {
      "firstName": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "normalizer": "case_insensitive_normalizer",
            "ignore_above": 256
          }
        }
      },
      "lastName": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "normalizer": "case_insensitive_normalizer",
            "ignore_above": 256
          }
        }
      },
      "designation": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "normalizer": "case_insensitive_normalizer",
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
            "normalizer": "case_insensitive_normalizer",
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
            "normalizer": "case_insensitive_normalizer",
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
    "index": "employee_with_keyword_and_analyzer"
  }
}'