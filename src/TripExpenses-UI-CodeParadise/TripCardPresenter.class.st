Class {
	#name : 'TripCardPresenter',
	#superclass : 'CpPresenter',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'view' }
TripCardPresenter class >> viewClass [ 
    ^ TripCardView
]

{ #category : 'rendering' }
TripCardPresenter >> onOpenTrip [

	self application showTrip: self model trip
]

{ #category : 'rendering' }
TripCardPresenter >> renderView [

	| trip participants |
	trip := self model.
	participants := trip participants inject: '' into: [ :acc :p |
			                acc isEmpty
				                ifTrue: [ p name ]
				                ifFalse: [ acc , ', ' , p name ] ].
	self view
		renderName: trip name;
		renderTotal: trip totalExpenses printString;
		renderParticipants: participants
]

{ #category : 'rendering' }
TripCardPresenter >> viewCreated [

	super viewCreated.
	self view when: CpOpenTripAnnouncement send: #onOpenTrip to: self
]
