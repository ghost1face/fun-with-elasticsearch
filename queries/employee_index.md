Simple employee sample dataset with several fields, the following request retrieves all metadata of the `employee` index:

```
GET employee
```

In this index you will notice that all `string` type fields are of type `text`.  Let's see how many documents are in this index:

```
GET employee/_count
```

Now let's look at all data in the index, using the `_search` resource:

```
POST employee/_search
```

You will notice here there are 100000 total records in the index, but only the first 10 records display. `10` is the default value for the `size` parameter, `0` is the default value of the `from` parameter when searching.  Let's look at the second page of 20 results.  Also note that max number of results from a search query is `10,000`:

```
POST employee/_search
{
    "query": {
        "match_all": {}
    },
    "size": 20,
    "from": 20
}
```

Let's retrieve one of our records by `id`:

```
GET employee/_doc/{uniqueidofarecord}
```

Now let's run a few search queries:

```
POST employee/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "query_string": {
            "fields": [
              "firstName",
              "lastName"
            ],
            "query": "Antony OR Jo"
          }
        }
     ]
    }
  }
}
```

These two are similar but not exactly the same, can you spot the difference? Which would be more applicable to a 'real-life' scenario? Which would perform better?

```
POST employee/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "range": {
            "age": {
              "lte": 30
            }
          }
        }
     ]
    }
  }
}

POST employee/_search
{
  "query": {
    "bool": {
      "filter": {
        "bool": {
          "must": [
            {
              "range": {
                "age": {
                  "lte": 30
                }
              }
            }
          ]
        }
      }
    }
  }
}
```

Let's search on interests, this should return those who are interested in JUST gymnastics, along with others who are interested in gymnastics AND other things.  Note the `_score` field:

```
GET employee/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "interests": "gymnastics"
          }
        }]
    }
  },
  "size": 10
}
```

Here's a gotcha with this index, we can't sort!

```
POST employee/_search 
{
  "sort": [
    {
      "lastName": {
        "order": "desc"
      }
    }
  ]
}
```