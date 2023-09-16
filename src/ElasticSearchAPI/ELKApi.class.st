"
Elasticsearch exposes [REST APIs](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html) that can be called directly to configure and access Elasticsearch features.

## Important

By default, `beHttps` and `beHttp` update the port accordingly to `443` and `80` 

## Usage Example

```st
api := ELKSearchApi new.
api beHttps.
api endpoint: 'elasticsearch.mySubDomain.domain.com'.
api index: 'myIndex'.
api apiKey: 'myAPIKey=='.
api size: 10.
api query: (ELKSQuery new
			 query: (ELKSTermRangeQuery new
					field: '@timestamp';
					gte: '2023-08-10';
					lte: '2023-08-12'	;				
					format: 'year_month_day');
					yourself).

api performRequest
```


"
Class {
	#name : #ELKApi,
	#superclass : #Object,
	#instVars : [
		'endpoint',
		'apiKey',
		'pretty',
		'port',
		'znClient',
		'https'
	],
	#category : #ElasticSearchAPI
}

{ #category : #accessing }
ELKApi >> apiKey [

	^ apiKey
]

{ #category : #accessing }
ELKApi >> apiKey: anObject [

	apiKey := anObject
]

{ #category : #accessing }
ELKApi >> beHttp [

	https := false.
	self port: 80
]

{ #category : #accessing }
ELKApi >> beHttps [

	https := true.
	self port: 443
]

{ #category : #accessing }
ELKApi >> beHttpsWithCertificate: aCertificatePath [
	https := true.
	znClient certificate: aCertificatePath
]

{ #category : #building }
ELKApi >> buildPath [
	self subclassResponsibility
]

{ #category : #building }
ELKApi >> buildQueryBody [
]

{ #category : #building }
ELKApi >> buildQueryParameter [
	znClient queryAt: #pretty put: self pretty
]

{ #category : #accessing }
ELKApi >> endpoint [

	^ endpoint
]

{ #category : #accessing }
ELKApi >> endpoint: anObject [

	endpoint := anObject
]

{ #category : #accessing }
ELKApi >> initialize [

	super initialize.
	pretty := false.
	self beHttp.
	self resetClient
]

{ #category : #accessing }
ELKApi >> isHttps [
	^ https
]

{ #category : #api }
ELKApi >> performRequest [

	self isHttps
		ifTrue: [ znClient https ]
		ifFalse: [ znClient http ].

	znClient forJsonREST.
	self apiKey ifNotNil: [ :anApiKey |
		znClient headerAt: #Authorization put: 'ApiKey ' , anApiKey ].
	znClient host: self endpoint.
	znClient port: self port.
	self buildPath.
	self buildQueryParameter.
	self buildQueryBody.
	^ znClient post
]

{ #category : #accessing }
ELKApi >> port [
	"default is 9200"

	^ port
]

{ #category : #accessing }
ELKApi >> port: anObject [

	port := anObject
]

{ #category : #accessing }
ELKApi >> pretty [

	^ pretty
]

{ #category : #accessing }
ELKApi >> pretty: anObject [

	pretty := anObject
]

{ #category : #accessing }
ELKApi >> resetClient [

	znClient := ZnClient new
]

{ #category : #accessing }
ELKApi >> znClient [

	^ znClient
]
