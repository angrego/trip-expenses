Class {
	#name : 'TripListViewTest',
	#superclass : 'PjWebAppTestCase',
	#instVars : [
		'container'
	],
	#category : 'TripExpenses-UI-Tests',
	#package : 'TripExpenses-UI-Tests'
}

{ #category : 'suite parameters' }
TripListViewTest class >> appClass [
	^ TripExpensesApp
]

{ #category : 'running' }
TripListViewTest >> setUp [
	super setUp.
	container := app mainContainer
]

{ #category : 'running' }
TripListViewTest >> testAddingTripAndReRenderShowsNewCard [
	app router service createTrip: 'Vacances'  currency: 'EUR'.
	app router showTripList.
	app router service createTrip: 'Road trip' currency: 'USD'.
	app router showTripList.
	self assert: (container querySelectorAll: '.trip-card') length equals: 2
]

{ #category : 'running' }
TripListViewTest >> testCardShowsTripCurrency [
	app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showTripList.
	self assert: ((container querySelector: '.trip-card') textContent
		includesSubstring: 'EUR')
]

{ #category : 'running' }
TripListViewTest >> testCardShowsTripName [
	app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showTripList.
	self assert: ((container querySelector: '.trip-card') textContent
		includesSubstring: 'Vacances')
]

{ #category : 'running' }
TripListViewTest >> testClickCardNavigatesToDetail [
	app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showTripList.
	(container querySelector: '.trip-card') click.
	self assert: (app router currentView isKindOf: TripDetailView)
]

{ #category : 'running' }
TripListViewTest >> testClickCardNavigatesWithCorrectTripId [
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showTripList.
	(container querySelector: '.trip-card') click.
	self assert: app router currentView tripId equals: trip id
]

{ #category : 'running' }
TripListViewTest >> testClickNewTripButtonCreatesTrip [
	(container querySelector: '#btn-new-trip') click.
	self assert: app router service allTrips size equals: 1
]

{ #category : 'running' }
TripListViewTest >> testClickNewTripButtonNavigatesToDetail [
	(container querySelector: '#btn-new-trip') click.
	self assert: (app router currentView isKindOf: TripDetailView)
]

{ #category : 'running' }
TripListViewTest >> testClickNewTripButtonNavigatesWithCorrectTripId [
	| trip |
	(container querySelector: '#btn-new-trip') click.
	trip := app router service allTrips first.
	self assert: app router currentView tripId equals: trip id
]

{ #category : 'running' }
TripListViewTest >> testCorrectCardNavigatesOnClick [
	"Cliquer sur le deuxième voyage navigue vers le bon id."
	| t1 t2 cards |
	t1 := app router service createTrip: 'Vacances'  currency: 'EUR'.
	t2 := app router service createTrip: 'Road trip' currency: 'USD'.
	app router showTripList.
	cards := container querySelectorAll: '.trip-card'.
	cards item: 1 "index 1 = deuxième carte".
	(cards item: 1) click.
	self assert: app router currentView tripId equals: t2 id
]

{ #category : 'running' }
TripListViewTest >> testEmptyListDoesNotShowTripCards [
	self assert: (container querySelector: '.trip-card') isNil
]

{ #category : 'running' }
TripListViewTest >> testEmptyListRendersContainer [
	"La vue se rend sans erreur même sans voyage."
	self assert: container innerHTML isNotEmpty
]

{ #category : 'running' }
TripListViewTest >> testEmptyListShowsEmptyMessage [ 
	self assert: (container querySelector: '.empty-msg') isNotNil
]

{ #category : 'running' }
TripListViewTest >> testNavigatingBackRefreshesCardList [
	"Créer un voyage, aller sur le détail, revenir :
	 la carte doit apparaître."
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showTripDetail: trip id.
	app router showTripList.
	self assert: (container querySelectorAll: '.trip-card') length equals: 1
]

{ #category : 'running' }
TripListViewTest >> testNewTripButtonExists [
	self assert: (container querySelector: '#btn-new-trip') isNotNil
]

{ #category : 'running' }
TripListViewTest >> testNewTripButtonHasBtnClass [
	self assert: ((container querySelector: '#btn-new-trip')
		getAttribute: 'class') equals: 'btn'
]

{ #category : 'running' }
TripListViewTest >> testOneCardPerTrip [
	app router service createTrip: 'Vacances' currency: 'EUR'.
	app router service createTrip: 'Road trip' currency: 'USD'.
	app router showTripList.
	self assert: (container querySelectorAll: '.trip-card') length equals: 2
]

{ #category : 'running' }
TripListViewTest >> testWithTripsNoEmptyMessage [
	app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showTripList.
	self assert: (container querySelector: '.empty-msg') isNil
]
