Class {
	#name : 'TripPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'trip',
		'appService',
		'expenseList',
		'addExpenseButton',
		'balanceList',
		'bilanList',
		'totalLabel',
		'tabBar',
		'currentPanel',
		'settlementList',
		'generositeList'
	],
	#category : 'TripExpenses-UI',
	#package : 'TripExpenses-UI'
}

{ #category : 'as yet unclassified' }
TripPresenter class >> on: aTrip service: aService [ 
    ^ self new
        trip: aTrip;
        appService: aService;
        yourself
]

{ #category : 'accessing' }
TripPresenter >> appService: s [

appService :=s
]

{ #category : 'accessing' }
TripPresenter >> buildHeader [ 
    ^ SpBoxLayout newLeftToRight
        add: totalLabel;
        addLast: addExpenseButton expand: false;
        yourself
]

{ #category : 'accessing' }
TripPresenter >> buildTabBar [ 
    ^ SpBoxLayout newLeftToRight
        add: (self newButton label: 'Dépenses'; action: [ self showPanel: #expenses ]; yourself) expand: false;
        add: (self newButton label: 'Balances'; action: [ self showPanel: #balances ]; yourself) expand: false;
        add: (self newButton label: 'Bilan';    action: [ self showPanel: #bilan ];    yourself) expand: false;
        yourself
]

{ #category : 'accessing' }
TripPresenter >> connectPresenters [
    addExpenseButton action: [ self onAddExpense ]
]

{ #category : 'accessing' }
TripPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
        add: (SpBoxLayout newLeftToRight
            add: totalLabel;
            addLast: addExpenseButton expand: false;
            yourself) expand: false;
        add: (SpBoxLayout newLeftToRight
            add: (self newButton label: 'Dépenses'; action: [ self showPanel: #expenses ]; yourself) expand: false;
            add: (self newButton label: 'Balances'; action: [ self showPanel: #balances ]; yourself) expand: false;
            add: (self newButton label: 'Bilan';    action: [ self showPanel: #bilan ];    yourself) expand: false;
            yourself) expand: false;
        add: expenseList;
        yourself

]

{ #category : 'accessing' }
TripPresenter >> initializePresenters [

	totalLabel := self newLabel.
	addExpenseButton := self newButton label: '+ Dépense'.
	expenseList := self newList.
	settlementList := self newList.
	generositeList := self newList.
	 balanceList      := self newList.

	expenseList display: [ :e |
			e description , '  —  ' , e totalAmount printString , '  ('
			, e date printString , ')' ].

	balanceList display: [ :assoc |
			| arrow |
			arrow := assoc value amount > 0
				         ifTrue: [ '+' ]
				         ifFalse: [ '' ].
			assoc key name , '  :  ' , arrow , assoc value printString ].

	settlementList display: [ :s |
		s from name , '  →  ' , s to name , '  :  ' , s amount printString ].

	generositeList display: [ :assoc |
		assoc key name , '  :  +' , assoc value printString ]
]

{ #category : 'accessing' }
TripPresenter >> initializeWindow [
    self title: 'TripExpenses — ' , trip name.
    self initialExtent: 420 @ 640
]

{ #category : 'accessing' }
TripPresenter >> onAddExpense [

  | form |
    form := AddExpensePresenter
        on: trip
        service: appService
        onSave: [ self refresh ].
    form refresh.
    form open
]

{ #category : 'accessing' }
TripPresenter >> refresh [
| genereux |
 Transcript
        show: 'expenseList: '    ; show: expenseList    printString; 
        show: 'balanceList: '    ; show: balanceList    printString; 
        show: 'settlementList: ' ; show: settlementList  printString;
        show: 'generositeList: ' ; show: generositeList  printString.
    trip := appService findTrip: trip id.

    totalLabel ifNotNil: [
        totalLabel label: trip name , '  —  Total : ' , trip totalExpenses printString ].

    expenseList    ifNotNil: [ expenseList items: trip expenses ].

    balanceList ifNotNil: [
        balanceList items: (trip balances associations
            asSortedCollection: [ :a :b | a value amount > b value amount ]) ].

    settlementList ifNotNil: [ settlementList items: trip settlements ].

    generositeList ifNotNil: [
        genereux := trip generosityReport associations
            select: [ :assoc | assoc value amount > 0 ].
        generositeList items: (genereux
            asSortedCollection: [ :a :b | a value amount > b value amount ]) ]
]

{ #category : 'accessing' }
TripPresenter >> showPanel: aSymbol [

	    | content |
    content := aSymbol = #expenses
        ifTrue: [ expenseList ]
        ifFalse: [
            aSymbol = #balances
                ifTrue: [ balanceList ]
                ifFalse: [
                    SpBoxLayout newTopToBottom
                        add: (self newLabel label: 'Remboursements') expand: false;
                        add: settlementList;
                        add: (self newLabel label: 'Générosité') expand: false;
                        add: generositeList;
                        yourself ] ].
    self layout: (SpBoxLayout newTopToBottom
        add: self buildHeader expand: false;
        add: self buildTabBar expand: false;
        add: content;
        yourself).
    self refresh
]

{ #category : 'accessing' }
TripPresenter >> trip: aTrip [
trip :=aTrip 
]
