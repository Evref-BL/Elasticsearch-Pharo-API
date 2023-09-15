"
Elasticsearch provides a full [Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html) (Domain Specific Language) based on JSON to define queries.
"
Class {
	#name : #ELKSQuery,
	#superclass : #Object,
	#traits : 'TELKSJsonableObject',
	#classTraits : 'TELKSJsonableObject classTrait',
	#instVars : [
		'filter'
	],
	#category : #'ElasticSearchAPI-Query'
}

{ #category : #accessing }
ELKSQuery >> addFilter: aQuery [

	self filter add: aQuery
]

{ #category : #accessing }
ELKSQuery >> filter [

	^ filter ifNil: [ filter := OrderedCollection new ]
]

{ #category : #accessing }
ELKSQuery >> filter: aCollectionOfQueries [

	filter := aCollectionOfQueries asCollection
]

{ #category : #'handling - json' }
ELKSQuery >> jsonableObject [

	^ Dictionary with:
		  'query' -> (Dictionary with: 'bool' -> (Dictionary with:
				    'filter' -> (self filter collect: #jsonableObject as: Array)))
]
