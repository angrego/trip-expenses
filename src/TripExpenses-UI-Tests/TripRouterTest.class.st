Class {
	#name : 'TripRouterTest',
	#superclass : 'PjWebAppTestCase',
	#category : 'TripExpenses-UI-Tests',
	#package : 'TripExpenses-UI-Tests'
}

{ #category : 'suite parameters' }
TripRouterTest class >> appClass [
	^ TripExpensesApp
]

{ #category : 'running' }
TripRouterTest >> setUp [
	super setUp
]

{ #category : 'running' }
TripRouterTest >> testInitialViewIsTripListView [
	self assert: (app router currentView isKindOf: TripListView)
]

{ #category : 'running' }
TripRouterTest >> testNavigationClearsContainer [
	"Naviguer deux fois ne doit pas empiler du HTML."
	| first |
	app router showTripList.
	first := app mainContainer innerHTML.
	app router showTripList.
	self assert: app mainContainer innerHTML equals: first
]

{ #category : 'running' }
TripRouterTest >> testRouterIsATripRouter [
	self assert: (app router isKindOf: TripRouter)
]

{ #category : 'running' }
TripRouterTest >> testRouterIsCreated [
	self assert: app router isNotNil
]

{ #category : 'running' }
TripRouterTest >> testServiceIsCreated [
	self assert: (app router service isKindOf: TripApplicationService)
]

{ #category : 'running' }
TripRouterTest >> testServiceStartsEmpty [
	self assert: app router service allTrips isEmpty
]

{ #category : 'running' }
TripRouterTest >> testShowAddExpensePassesTripId [
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showAddExpense: trip id.
	self assert: app router currentView tripId equals: trip id
]

{ #category : 'running' }
TripRouterTest >> testShowAddExpenseSetsCorrectView [
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showAddExpense: trip id.
	self assert: (app router currentView isKindOf: AddExpenseView)
]

{ #category : 'running' }
TripRouterTest >> testShowSettlementsPassesTripId [
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showSettlements: trip id.
	self assert: app router currentView tripId equals: trip id
]

{ #category : 'running' }
TripRouterTest >> testShowSettlementsSetsCorrectView [
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showSettlements: trip id.
	self assert: (app router currentView isKindOf: SettlementView)
]

{ #category : 'running' }
TripRouterTest >> testShowTripDetailPassesTripId [
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showTripDetail: trip id.
	self assert: app router currentView tripId equals: trip id
]

{ #category : 'running' }
TripRouterTest >> testShowTripDetailSetsCorrectView [
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showTripDetail: trip id.
	self assert: (app router currentView isKindOf: TripDetailView)
]

{ #category : 'running' }
TripRouterTest >> testShowTripListRendersInMain [
	app router showTripList.
	self assert: app mainContainer innerHTML isNotEmpty
]
