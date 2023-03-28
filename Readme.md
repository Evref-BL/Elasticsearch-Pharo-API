# Elasticsearch - Pharo API

This is a client for the [elasticsearch REST API](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html) in Pharo.

We improve this repository when we need it, and thus it might not implement all the features.

## Installation

```st
Metacello new
  githubUser: 'Evref-BL' project: 'Elasticsearch-Pharo-API' commitish: 'main' path: 'src';
  baseline: 'ElasticsearchAPI';
  load
```

## Usage example

```st

api := ELKSearchApi new.
api beHttp.
api endpoint: 'localhost'.
api port: 9200.
api index: '.ds-traces-apm-default-2023.02.17-000001'.
api apiKey: '<myToken>'.
api size: 5000.

api  performRequest 
```
