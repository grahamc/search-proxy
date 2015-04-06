# Clarify Unauthenticated Search Proxy

This proxy accepts requests to `/v1/search`, adds your Clarify API key, and
passes them through to the Clarify API's search endpoint. This is useful for
public-facing search functionality without publicly exposing your API client
key. Note that any searches going through this will be billed based on
Clarify's standard billing.

## Usage

### Nginx

Add the `default.conf` file to your nginx server, edit the server name, and
change `CLARIFY_API_KEY` to your application's API key.

### Docker

`docker run -p 8080:80 -e CLARIFY_API_KEY=your-key-here clarifyio/search-proxy`

## Then

```
$ http get http://192.168.59.103:8080/v1/search\?query\=flying
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 273
Content-Type: application/hal+json
Date: Mon, 06 Apr 2015 19:54:01 GMT
Server: nginx/1.7.11
cache-control: no-cache
content-encoding: gzip
vary: accept-encoding

{
    "_class": "SearchCollection",
    "_links": {
        "first": {
            "href": "/v1/search?query=flying&iterator=S10a47fbc8ef"
        },
        "items": [
            {
                "href": "/v1/bundles/3fbca3fe3678495fb08fe939dbe4f1cd"
            }
        ],
        "self": {
            "href": "/v1/search?query=flying"
        }
    },
    "item_results": [
        {
            "score": 1,
            "term_results": [
                {
                    "matches": [
                        {
                            "field": "name",
                            "hits": [
                                {
                                    "end": 29,
                                    "start": 23
                                }
                            ],
                            "type": "text"
                        },
                        {
                            "field": "bundle.name",
                            "hits": [
                                {
                                    "end": 29,
                                    "start": 23
                                }
                            ],
                            "type": "text"
                        }
                    ],
                    "score": 0.942
                }
            ]
        }
    ],
    "limit": 10,
    "search_terms": [
        {
            "term": "flying"
        }
    ],
    "total": 1
}
```
