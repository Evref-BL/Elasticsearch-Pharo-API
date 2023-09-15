"
The [range query](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-range-query.html) returns documents that contain terms within a provided range.
When the `field` parameter is a date field data type, you can use [date math](https://www.elastic.co/guide/en/elasticsearch/reference/current/common-options.html#date-math) with the following parameters: `gt`, `gte`, `lt` and `lte`.
"
Class {
	#name : #ELKSTermRangeQuery,
	#superclass : #ELKSTermLevelQuery,
	#instVars : [
		'gt',
		'gte',
		'lt',
		'lte',
		'format'
	],
	#category : #'ElasticSearchAPI-Query'
}

{ #category : #accessing }
ELKSTermRangeQuery >> format [

	^ format
]

{ #category : #accessing }
ELKSTermRangeQuery >> format: anObject [

	format := anObject
]

{ #category : #accessing }
ELKSTermRangeQuery >> gt [

	^ gt
]

{ #category : #accessing }
ELKSTermRangeQuery >> gt: anObject [

	gt := anObject
]

{ #category : #accessing }
ELKSTermRangeQuery >> gte [

	^ gte
]

{ #category : #accessing }
ELKSTermRangeQuery >> gte: anObject [

	gte := anObject
]

{ #category : #'as yet unclassified' }
ELKSTermRangeQuery >> jsonableObject [

	| dic |
	dic := Dictionary new.
	self format ifNotNil: [ dic at: #format put: self format ].
	self gt ifNotNil: [ dic at: #gt put: self gt ].
	self gte ifNotNil: [ dic at: #gte put: self gte ].
	self lt ifNotNil: [ dic at: #lt put: self lt ].
	self lte ifNotNil: [ dic at: #lte put: self lte ].

	^ Dictionary new
		  at: #range put: { (self field -> dic) } asDictionary;
		  yourself
]

{ #category : #accessing }
ELKSTermRangeQuery >> lt [

	^ lt
]

{ #category : #accessing }
ELKSTermRangeQuery >> lt: anObject [

	lt := anObject
]

{ #category : #accessing }
ELKSTermRangeQuery >> lte [

	^ lte
]

{ #category : #accessing }
ELKSTermRangeQuery >> lte: anObject [

	lte := anObject
]
