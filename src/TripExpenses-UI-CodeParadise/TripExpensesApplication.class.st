Class {
	#name : 'TripExpensesApplication',
	#superclass : 'CpMvpWebApplication',
	#instVars : [
		'repository',
		'currentTrip'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'accessing' }
TripExpensesApplication class >> app [

	^ #'trip-expenses'
]

{ #category : 'accessing' }
TripExpensesApplication class >> description [
	^ 'Trip Expenses - grego'
]

{ #category : 'initialization' }
TripExpensesApplication >> addExpense: anExpense toTrip: aTripId [ 
    self repository addExpense: anExpense toTrip: aTripId
]

{ #category : 'initialization' }
TripExpensesApplication >> allTrips [ 
    ^ self repository allTrips collect: [ :t | TripModel on: t ]
]

{ #category : 'initialization' }
TripExpensesApplication >> applicationModel [

	^ self
]

{ #category : 'initialization' }
TripExpensesApplication >> currentTrip [ 
    ^ currentTrip
]

{ #category : 'initialization' }
TripExpensesApplication >> initialize [
    super initialize.
    repository := STONTripRepository default
]

{ #category : 'initialization' }
TripExpensesApplication >> preferredPresenterClass [
    ^ TripExpensesApplicationPresenter
]

{ #category : 'initialization' }
TripExpensesApplication >> repository [

	repository ifNil: [ repository := STONTripRepository default ].
	^ repository
]

{ #category : 'initialization' }
TripExpensesApplication >> showAddExpense: aTrip [
	currentTrip := aTrip.
	self announce: CpShowAddExpenseAnnouncement new
]

{ #category : 'initialization' }
TripExpensesApplication >> showTrip: aTrip [

	currentTrip := aTrip.
	self announce: CpCurrentTripChanged
]

{ #category : 'initialization' }
TripExpensesApplication >> showTripList [

	currentTrip := nil.
	self announce: CpCurrentTripChanged new
]
