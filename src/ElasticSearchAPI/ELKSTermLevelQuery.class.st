"
You can use [term-level queries](https://www.elastic.co/guide/en/elasticsearch/reference/current/term-level-queries.html) to find documents based on precise values in structured data.
Examples of structured data include date ranges, IP addresses, prices, or product IDs.
"
Class {
	#name : #ELKSTermLevelQuery,
	#superclass : #Object,
	#traits : 'TELKSJsonableObject',
	#classTraits : 'TELKSJsonableObject classTrait',
	#instVars : [
		'field'
	],
	#category : #'ElasticSearchAPI-Query'
}

{ #category : #accessing }
ELKSTermLevelQuery >> field [

	^ field
]

{ #category : #accessing }
ELKSTermLevelQuery >> field: aString [

	field := aString
]
