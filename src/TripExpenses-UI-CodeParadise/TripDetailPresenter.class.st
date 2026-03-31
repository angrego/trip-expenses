Class {
	#name : 'TripDetailPresenter',
	#superclass : 'CpPresenter',
	#instVars : [
		'currentTab',
		'app',
		'trip'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'accessing' }
TripDetailPresenter class >> defaultViewClass [ 

	^ TripDetailView
]

{ #category : 'accessing' }
TripDetailPresenter class >> viewClass [
    ^ TripDetailView
]

{ #category : 'initialization' }
TripDetailPresenter >> initialize [
    super initialize.
    currentTab := #expenses
]

{ #category : 'initialization' }
TripDetailPresenter >> onAddExpense [

app showAddExpense: self model trip
]

{ #category : 'initialization' }
TripDetailPresenter >> onBack [
	app showTripList
]

{ #category : 'initialization' }
TripDetailPresenter >> onShowBalances [
    currentTab := #balances.
    self renderCurrentTab
]

{ #category : 'initialization' }
TripDetailPresenter >> onShowBilan [
    currentTab := #bilan.
    self renderCurrentTab
]

{ #category : 'initialization' }
TripDetailPresenter >> onShowExpenses [
    currentTab := #expenses.
    self renderCurrentTab
]

{ #category : 'initialization' }
TripDetailPresenter >> renderBalances [
   | balances|
    balances := self model trip balances.
    self
        renderAllChildViewsForModels: (balances associations
            collect: [ :assoc | BalanceModel participant: assoc key amount: assoc value ])
        usingPresenter: BalanceRowPresenter
        atSlotNamed: #content
]

{ #category : 'initialization' }
TripDetailPresenter >> renderBilan [
 trip settlements isEmpty
        ifTrue: [
            self view renderContent: '<ion-item><ion-label>Tout est réglé !</ion-label></ion-item>'.
            ^ self ].
    self
        renderAllChildViewsForModels: (trip settlements
            collect: [ :s | SettlementModel from: s ])
        usingPresenter: SettlementRowPresenter
        atSlotNamed: #content
]

{ #category : 'initialization' }
TripDetailPresenter >> renderCurrentTab [
    currentTab = #expenses ifTrue: [ ^ self renderExpenses ].
    currentTab = #balances ifTrue: [ ^ self renderBalances ].
    currentTab = #bilan    ifTrue: [ ^ self renderBilan ]
]

{ #category : 'initialization' }
TripDetailPresenter >> renderExpenses [
   self
        renderAllChildViewsForModels: (trip expenses
            collect: [ :e | ExpenseModel from: e ])
        usingPresenter: ExpenseRowPresenter
        atSlotNamed: #content
]

{ #category : 'initialization' }
TripDetailPresenter >> renderView [

	app := self model application.
	trip := self model trip.
	self renderCurrentTab.
	self view
		renderName: self model trip name;
		renderTotal: self model trip totalExpenses printString
]

{ #category : 'initialization' }
TripDetailPresenter >> viewCreated [

	super viewCreated.
	self view
		when: CpBackAnnouncement send: #onBack to: self;
		when: CpShowExpensesAnnouncement send: #onShowExpenses to: self;
		when: CpShowBalancesAnnouncement send: #onShowBalances to: self;
		when: CpShowBilanAnnouncement send: #onShowBilan to: self;
		when: CpAddExpenseAnnouncement send: #onAddExpense to: self
]
