Class {
	#name : 'TripApplicationServiceTest',
	#superclass : 'TestCase',
	#instVars : [
		'service',
		'repository'
	],
	#category : 'TripExpenses-Application-Test',
	#package : 'TripExpenses-Application-Test'
}

{ #category : 'helpers' }
TripApplicationServiceTest >> makeExpensePaidBy: aPayer onTrip: aTrip [
	"Crée une dépense minimale dont le seul payeur est aPayer,
	 répartie équitablement entre tous les participants du voyage."
	| rule |
	rule := EqualSplitRule among:
		(aTrip participants collect: [ :p | ParticipantWeight participant: p ]).
	^ Expense
		description: 'Test expense'
		totalAmount: (Money amount: 90 currency: 'EUR')
		payments: { Payment participant: aPayer
		                   amount: (Money amount: 90 currency: 'EUR') }
		splitRule: rule
		gifts: {}
		date: Date today
]

{ #category : 'running' }
TripApplicationServiceTest >> setUp [
	repository := InMemoryTripRepository new.
	service    := TripApplicationService withRepository: repository
]

{ #category : 'tests - createTrip' }
TripApplicationServiceTest >> testCreateTripAssignsId [
	| trip |
	trip := service createTrip: 'Vacances' currency: 'EUR'.
	self assert: trip id isNotNil.
	self assert: trip id isNotEmpty
]

{ #category : 'tests - createTrip' }
TripApplicationServiceTest >> testCreateTripHasNoExpenses [
	| trip |
	trip := service createTrip: 'Vacances' currency: 'EUR'.
	self assert: trip expenses isEmpty
]

{ #category : 'tests - createTrip' }
TripApplicationServiceTest >> testCreateTripHasNoParticipants [
	| trip |
	trip := service createTrip: 'Vacances' currency: 'EUR'.
	self assert: trip participants isEmpty
]

{ #category : 'tests - createTrip' }
TripApplicationServiceTest >> testCreateTripIsPersisted [
	| trip |
	trip := service createTrip: 'Vacances' currency: 'EUR'.
	self assert: repository size equals: 1
]

{ #category : 'tests - createTrip' }
TripApplicationServiceTest >> testCreateTripReturnsATrip [
	| trip |
	trip := service createTrip: 'Vacances' currency: 'EUR'.
	self assert: (trip isKindOf: Trip)
]

{ #category : 'tests - createTrip' }
TripApplicationServiceTest >> testCreateTripStoresCurrency [
	| trip |
	trip := service createTrip: 'Vacances' currency: 'EUR'.
	self assert: trip currency equals: 'EUR'
]

{ #category : 'tests - createTrip' }
TripApplicationServiceTest >> testCreateTripStoresName [ 
	| trip |
	trip := service createTrip: 'Vacances' currency: 'EUR'.
	self assert: trip name equals: 'Vacances'
]

{ #category : 'tests - createTrip' }
TripApplicationServiceTest >> testTwoTripsHaveDifferentIds [
	| t1 t2 |
	t1 := service createTrip: 'Vacances' currency: 'EUR'.
	t2 := service createTrip: 'Road trip' currency: 'USD'.
	self deny: t1 id equals: t2 id
]

{ #category : 'helpers' }
TripApplicationServiceTest >> tripWithAliceAndBob [
	"Crée un voyage sauvegardé avec deux participants, retourne un tableau
	 ordonnancé #(trip alice bob)."
	| trip alice bob |
	trip  := service createTrip: 'Vacances' currency: 'EUR'.
	alice := service addParticipant: 'Alice' toTrip: trip id.
	bob   := service addParticipant: 'Bob'   toTrip: trip id.
	^ Array with: trip with: alice with: bob
]
