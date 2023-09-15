"
Elasticsearch exposes [REST APIs](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html) that can be called directly to configure and access Elasticsearch features.
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
	https := false
]

{ #category : #accessing }
ELKApi >> beHttps [
	https := true
]

{ #category : #building }
ELKApi >> buildPath [
	self subclassResponsibility
]

{ #category : #api }
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
	port := 9200.
	https := true.
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
