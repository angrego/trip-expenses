Class {
	#name : 'InMemoryTripRepository',
	#superclass : 'Object',
	#instVars : [
		'store'
	],
	#category : 'TripExpenses-Application-Test',
	#package : 'TripExpenses-Application-Test'
}

{ #category : 'instance creation' }
InMemoryTripRepository class >> new [
^ super new init
]

{ #category : 'accessing' }
InMemoryTripRepository >> findAll [
	^ store copy
]

{ #category : 'accessing' }
InMemoryTripRepository >> findById: anId [
	^ store
		detect: [ :t | t id = anId ]
		ifNone: [ Error signal: 'Trip not found: ' , anId ]
]

{ #category : 'private - initialization' }
InMemoryTripRepository >> init [
	store := OrderedCollection new
]

{ #category : 'accessing' }
InMemoryTripRepository >> save: aTrip [
	store := store reject: [ :t | t id = aTrip id ].
	store add: aTrip
]

{ #category : 'private - initialization' }
InMemoryTripRepository >> size [
	^ store size
]
