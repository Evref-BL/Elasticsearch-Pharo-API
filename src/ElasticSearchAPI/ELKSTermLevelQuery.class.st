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
ELKSTermLevelQuery >> field: anObject [

	field := anObject
]
