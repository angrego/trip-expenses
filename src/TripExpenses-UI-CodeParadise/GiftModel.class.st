Class {
	#name : 'GiftModel',
	#superclass : 'CpModel',
	#instVars : [
		'participantNames'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'as yet unclassified' }
GiftModel class >> withParticipants: aCollection [
    ^ self new
        participantNames: aCollection;
        yourself
]

{ #category : 'accessing' }
GiftModel >> participantNames [

	^ participantNames
]

{ #category : 'accessing' }
GiftModel >> participantNames: anObject [

	participantNames := anObject
]
