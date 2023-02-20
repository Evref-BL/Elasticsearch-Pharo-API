Class {
	#name : #BaselineOfElasticsearchAPI,
	#superclass : #BaselineOf,
	#category : #BaselineOfElasticsearchAPI
}

{ #category : #baselines }
BaselineOfElasticsearchAPI >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfElasticsearchAPI >> defineDependencies: spec [
]

{ #category : #baselines }
BaselineOfElasticsearchAPI >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfElasticsearchAPI >> definePackages: spec [

	spec package: 'ElasticSearchAPI'
]
