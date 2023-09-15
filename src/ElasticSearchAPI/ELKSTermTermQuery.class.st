"
The [term query](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-term-query.html ) returns documents that contain an exact term in a provided field.

You can use the term query to find documents based on a precise value such as a price, a product ID, or a username.
"
Class {
	#name : #ELKSTermTermQuery,
	#superclass : #ELKSTermLevelQuery,
	#instVars : [
		'val',
		'boost',
		'case_insensitive'
	],
	#category : #'ElasticSearchAPI-Query'
}

{ #category : #accessing }
ELKSTermTermQuery >> beCaseInsensitive [

	case_insensitive := true
]

{ #category : #accessing }
ELKSTermTermQuery >> beCaseSensitive [

	case_insensitive := false
]

{ #category : #accessing }
ELKSTermTermQuery >> boost [

	^ boost
]

{ #category : #accessing }
ELKSTermTermQuery >> boost: anObject [

	boost := anObject
]

{ #category : #accessing }
ELKSTermTermQuery >> case_insensitive [

	^ case_insensitive
]

{ #category : #accessing }
ELKSTermTermQuery >> case_insensitive: anObject [

	case_insensitive := anObject
]

{ #category : #accessing }
ELKSTermTermQuery >> jsonableObject [

	| dic |
	dic := Dictionary new.
	self val ifNil: [
		Error signal:
			'value is required with an ' , self class name , ' query' ].
	dic at: #value put: self val.
	self case_insensitive ifNotNil: [ :ci |
		dic at: #case_insensitive put: ci ].
	self boost ifNotNil: [ :ci | dic at: #boost put: ci ].

	^ dic
]

{ #category : #accessing }
ELKSTermTermQuery >> val [

	^ val
]

{ #category : #accessing }
ELKSTermTermQuery >> val: anObject [

	val := anObject
]
