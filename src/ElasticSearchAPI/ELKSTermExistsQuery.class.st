"
The [exists query](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-exists-query.html) returns documents that contain an indexed value for a field.

"
Class {
	#name : #ELKSTermExistsQuery,
	#superclass : #ELKSTermLevelQuery,
	#category : #'ElasticSearchAPI-Query'
}

{ #category : #'handling - json' }
ELKSTermExistsQuery >> jsonableObject [

	^ Dictionary with:
		  'exists' -> (Dictionary with: 'field' -> self field)
]
