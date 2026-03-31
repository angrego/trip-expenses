Class {
	#name : 'ParticipantModel',
	#superclass : 'CpModel',
	#instVars : [
		'participantName',
		'participantId'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'instance creation' }
ParticipantModel class >> from: aParticipant [

	^ self new
		  participantId: aParticipant id value
		  participantName: aParticipant name value;
		  yourself
]

{ #category : 'accessing' }
ParticipantModel >> id [

	^ participantId
]

{ #category : 'accessing' }
ParticipantModel >> name [

	^  participantName
]

{ #category : 'accessing' }
ParticipantModel >> participantId: aParticipantId participantName: aParticipantName [

	participantName := aParticipantName.
	participantId := aParticipantId
]

{ #category : 'accessing' }
ParticipantModel >> preferredPresenterClass [

	^ ParticipantRowPresenter
]
