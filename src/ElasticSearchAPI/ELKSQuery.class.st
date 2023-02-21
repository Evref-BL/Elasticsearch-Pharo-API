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
