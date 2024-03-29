"
This is a class that implements the [SearchAPI of ELK](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-search.html)
"
Class {
	#name : #ELKSearchApi,
	#superclass : #ELKApi,
	#instVars : [
		'index',
		'size',
		'query'
	],
	#category : #ElasticSearchAPI
}

{ #category : #building }
ELKSearchApi >> buildPath [

	self index
		ifNotNil: [ :idx | znClient path: idx , '/_search' ]
		ifNil: [ znClient path: '_search' ]
]

{ #category : #building }
ELKSearchApi >> buildQueryBody [

	self query ifNotNil: [ :queryEntity | 
		znClient entity:
			(ZnEntity json: (NeoJSONWriter toString: queryEntity jsonableObject)) ]
]

{ #category : #building }
ELKSearchApi >> buildQueryParameter [

	self size ifNotNil: [ :aSize | znClient queryAt: #size put: aSize ]
]

{ #category : #accessing }
ELKSearchApi >> index [

	^ index
]

{ #category : #accessing }
ELKSearchApi >> index: anObject [

	index := anObject
]

{ #category : #accessing }
ELKSearchApi >> query [

	^ query
]

{ #category : #accessing }
ELKSearchApi >> query: anObject [

	query := anObject
]

{ #category : #accessing }
ELKSearchApi >> size [

	^ size
]

{ #category : #accessing }
ELKSearchApi >> size: anObject [

	size := anObject
]
