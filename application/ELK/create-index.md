PUT xlink-base-service
PUT xlink-base-service/_mapping/doc
{
    "properties": {
        "local_time": {
            "type": "date",
            "format": "yyyy-MM-dd HH:mm:ss.SSSZ"
        },
        "cost": {
            "type": "long",
            "index": false,
            "fields": {
              "keyword": { 
              "type": "keyword"
              }
            } 
        },
        "res_num_1": {
            "type": "double",
            "index": false,
            "fields": {
              "keyword": { 
              "type": "keyword"
              }
            } 
        },
        "res_num_2": {
            "type": "double",
            "index": false,
            "fields": {
              "keyword": { 
              "type": "keyword"
              }
            } 
        },
        "res_num_3": {
            "type": "double",
            "index": false,
            "fields": {
              "keyword": { 
              "type": "keyword"
              }
            } 
        },
        "res_num_4": {
            "type": "double",
            "index": false,
            "fields": {
              "keyword": { 
              "type": "keyword"
              }
            } 
        }
    }
}


PUT xlink-base-service

GET xlink-base-service/_mapping/doc
