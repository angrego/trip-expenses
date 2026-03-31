Class {
	#name : 'ParticipantRowPresenter',
	#superclass : 'CpPresenter',
	#instVars : [
		'weight',
		'included'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'accessing' }
ParticipantRowPresenter >> included [

	^ included
]

{ #category : 'initialization' }
ParticipantRowPresenter >> initialize [
    super initialize.
    weight := 1.
    included := true
]

{ #category : 'initialization' }
ParticipantRowPresenter >> onIncludedChanged: ann [
    included := ann included
]

{ #category : 'initialization' }
ParticipantRowPresenter >> onWeightChanged: ann [ 
    weight := ann weight

]

{ #category : 'initialization' }
ParticipantRowPresenter >> participantWeight [ 
    included ifFalse: [ ^ nil ].
    ^ ParticipantWeight
        participant: (self parent model trip participants
            detect: [ :p | p id value = self model id ])
        weight: weight
]

{ #category : 'initialization' }
ParticipantRowPresenter >> renderView [

self view
        renderName: self model name;
        renderWeight: weight;
        renderIncluded: included
]

{ #category : 'initialization' }
ParticipantRowPresenter >> viewCreated [

	super viewCreated.
	self view
		when: CpWeightChangedAnnouncement send: #onWeightChanged: to: self;
		when: CpIncludedChangedAnnouncement send:#onIncludedChanged: to: self
]

{ #category : 'accessing' }
ParticipantRowPresenter >> weight [

	^ weight
]
