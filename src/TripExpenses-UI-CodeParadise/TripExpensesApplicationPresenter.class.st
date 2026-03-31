Class {
	#name : 'TripExpensesApplicationPresenter',
	#superclass : 'CpPresenter',
	#instVars : [
		'appService'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'view' }
TripExpensesApplicationPresenter class >> viewClass [ 
    ^ TripExpensesApplicationView
]

{ #category : 'initialization' }
TripExpensesApplicationPresenter >> createTrip: aName [
    appService createTrip: aName currency: 'EUR'.
    self renderView
]

{ #category : 'initialization' }
TripExpensesApplicationPresenter >> initialize [
    super initialize.
    self model
        when: #currentTrip
        send: #renderView
        to: self
]

{ #category : 'initialization' }
TripExpensesApplicationPresenter >> onOpenTrip [
    self application showTrip: self model trip
]

{ #category : 'initialization' }
TripExpensesApplicationPresenter >> renderAddExpense [

	| tripModel |
	tripModel := TripModel on: self model currentTrip.
	tripModel application: self model.
	self
		renderChildViewForModel: tripModel
		usingPresenter: AddExpensePresenter
		atSlotNamed: #trips
]

{ #category : 'initialization' }
TripExpensesApplicationPresenter >> renderTripDetail: aTrip [

	| tripModel |
	tripModel := TripModel on: aTrip.
	tripModel application: self application.
	self
		renderChildViewForModel: tripModel
		usingPresenter: TripDetailPresenter
		atSlotNamed: #trips
]

{ #category : 'initialization' }
TripExpensesApplicationPresenter >> renderTripList [

 self
        renderAllChildViewsForModels: self model allTrips
        usingPresenter: TripCardPresenter
        atSlotNamed: #trips
]

{ #category : 'initialization' }
TripExpensesApplicationPresenter >> renderView [

	self model currentTrip
		ifNil: [ self renderTripList ]
		ifNotNil: [ :trip | self renderTripDetail: trip ]
]

{ #category : 'initialization' }
TripExpensesApplicationPresenter >> viewCreated [

	super viewCreated.
	self model 
		when: CpCurrentTripChanged send: #renderView to: self;
		when: CpShowAddExpenseAnnouncement send: #renderAddExpense to: self
]
