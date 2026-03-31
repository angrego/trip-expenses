Class {
	#name : 'TripExpensesAppTest',
	#superclass : 'PjWebAppTestCase',
	#category : 'TripExpenses-UI-Tests',
	#package : 'TripExpenses-UI-Tests'
}

{ #category : 'suite parameters' }
TripExpensesAppTest class >> appClass [
	^ TripExpensesApp
]

{ #category : 'running' }
TripExpensesAppTest >> setUp [
	super setUp.
]

{ #category : 'tests - initialization' }
TripExpensesAppTest >> testAppCreatesRouter [
	self assert: app router isNotNil
]

{ #category : 'tests - initialization' }
TripExpensesAppTest >> testAppRouterIsATripRouter [
	self assert: (app router isKindOf: TripRouter)
]

{ #category : 'tests - initialization' }
TripExpensesAppTest >> testAppServiceIsEmpty [
	self assert: app router service allTrips isEmpty
]

{ #category : 'tests - initialization' }
TripExpensesAppTest >> testHeaderExistsInDOM [
	self assert: (app elementAt: 'app-header') isNotNil
]

{ #category : 'tests - initialization' }
TripExpensesAppTest >> testInitialViewIsTripListView [
	self assert: (app router currentView isKindOf: TripListView)
]

{ #category : 'tests - initialization' }
TripExpensesAppTest >> testMainContainerExistsInDOM [
	self assert: (app elementAt: 'app-main') isNotNil
]

{ #category : 'tests - navigation' }
TripExpensesAppTest >> testNavigationClearsContainer [ 
	"Naviguer deux fois ne doit pas empiler du HTML."
	| firstHTML |
	app router showTripList.
	firstHTML := app mainContainer innerHTML.
	app router showTripList.
	self assert: app mainContainer innerHTML equals: firstHTML
]

{ #category : 'tests - navigation' }
TripExpensesAppTest >> testShowAddExpenseSetsCorrectView [ 
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showAddExpense: trip id.
	self assert: (app router currentView isKindOf: AddExpenseView)
]

{ #category : 'tests - navigation' }
TripExpensesAppTest >> testShowSettlementsSetsCorrectView [
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showSettlements: trip id.
	self assert: (app router currentView isKindOf: SettlementView)
]

{ #category : 'tests - navigation' }
TripExpensesAppTest >> testShowTripDetailSetsCorrectView [
	| trip |
	trip := app router service createTrip: 'Vacances' currency: 'EUR'.
	app router showTripDetail: trip id.
	self assert: (app router currentView isKindOf: TripDetailView)
]

{ #category : 'tests - navigation' }
TripExpensesAppTest >> testShowTripListRendersInMain [
	app router showTripList.
	self assert: app mainContainer innerHTML isNotEmpty
]
