Class {
	#name : #ELKApi,
	#superclass : #Object,
	#instVars : [
		'endpoint',
		'apiKey',
		'pretty',
		'port',
		'znClient'
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

{ #category : #building }
ELKApi >> buildPath [
	self subclassResponsibility
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
	port := 9200
]

{ #category : #api }
ELKApi >> performRequest [

	znClient := ZnEasy client.
	znClient http.
	znClient forJsonREST.
	self apiKey ifNotNil: [ :anApiKey | 
		znClient headerAt: #Authorization put: 'ApiKey ' , anApiKey ].
	znClient host: self endpoint.
	znClient port: self port.
	self buildPath.
	self buildQueryParameter.
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
