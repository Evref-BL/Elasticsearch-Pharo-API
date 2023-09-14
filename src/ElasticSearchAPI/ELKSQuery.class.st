"
Elasticsearch provides a full [Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html) (Domain Specific Language) based on JSON to define queries.
"
Class {
	#name : #ELKSQuery,
	#superclass : #Object,
	#traits : 'TELKSJsonableObject',
	#classTraits : 'TELKSJsonableObject classTrait',
	#instVars : [
		'query'
	],
	#category : #'ElasticSearchAPI-Query'
}

{ #category : #'as yet unclassified' }
ELKSQuery >> jsonableObject [

	^ Dictionary new
		  at: #query put: self query jsonableObject;
		  yourself
]

{ #category : #accessing }
ELKSQuery >> query [

	^ query
]

{ #category : #accessing }
ELKSQuery >> query: anObject [

	query := anObject
]
