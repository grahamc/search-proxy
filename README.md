# Clarify Unauthenticated Search Proxy

This proxy accepts requests to `/v1/search`, adds your API key, and passes them
through to the Clarify API's search endpoint.

## Usage

### Nginx

Add the `default.conf` file to your nginx server, edit the server name, and
change `CLARIFY_API_KEY` to your application's API key.

### Docker

`docker run -p 8080:80 -e CLARIFY_API_KEY=your-key-here clarifyio/search-proxy`
