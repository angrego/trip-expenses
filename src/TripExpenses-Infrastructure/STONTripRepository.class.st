Class {
	#name : 'STONTripRepository',
	#superclass : 'Object',
	#instVars : [
		'filePath',
		'repository'
	],
	#category : 'TripExpenses-Infrastructure',
	#package : 'TripExpenses-Infrastructure'
}

{ #category : 'as yet unclassified' }
STONTripRepository class >> default [
    ^ self onFile: 'trip-expenses.ston' asFileReference
]

{ #category : 'as yet unclassified' }
STONTripRepository class >> inMemory [
^ self new
]

{ #category : 'as yet unclassified' }
STONTripRepository class >> onFile: aFileReference [

	^ self new
		  filePath: aFileReference;
		  yourself
]

{ #category : 'as yet unclassified' }
STONTripRepository >> addExpense: anExpense toTrip: aTripId [ 
    | trip |
    trip := self findById: aTripId.
    trip addExpense: anExpense.
    self save: trip.
    ^ anExpense
]

{ #category : 'as yet unclassified' }
STONTripRepository >> addParticipant: aName toTrip: aTripId [
    | trip participant |
    trip := repository findById: aTripId.
    participant := Participant name: aName.
    trip addParticipant: participant.
    repository save: trip.
    ^ participant
]

{ #category : 'as yet unclassified' }
STONTripRepository >> allTrips [
    ^ self findAll
]

{ #category : 'as yet unclassified' }
STONTripRepository >> createTrip: aName currency: aCurrency [ 
    | trip |
    trip := Trip name: aName currency: aCurrency.
    repository save: trip.
    ^ trip
]

{ #category : 'accessing' }
STONTripRepository >> deleteById: anId [
    | all |
    all := self findAll reject: [ :t | t id = anId ].
    filePath writeStreamDo: [ :s | STON put: all onStream: s ]
]

{ #category : 'accessing' }
STONTripRepository >> filePath [ 
 ^ filePath 
]

{ #category : 'accessing' }
STONTripRepository >> filePath: aRef [

	filePath := aRef
]

{ #category : 'accessing' }
STONTripRepository >> findAll [
    filePath exists ifFalse: [ ^ OrderedCollection new ].
    ^ filePath readStreamDo: [ :s | STON fromStream: s ]
]

{ #category : 'accessing' }
STONTripRepository >> findById: anId [
    ^ self findAll
        detect: [ :t | t id = anId ]
        ifNone: [ Error signal: 'Trip not found: ' , anId ]
]

{ #category : 'as yet unclassified' }
STONTripRepository >> repository [ 
^ repository
]

{ #category : 'as yet unclassified' }
STONTripRepository >> repository: r [ 
repository := r 
]

{ #category : 'accessing' }
STONTripRepository >> save: aTrip [ 
    | all |
    all := self findAll.
    all := all reject: [ :t | t id = aTrip id ].
    all add: aTrip.
    filePath writeStreamDo: [ :s |
        STON put: all onStream: s ]
]
