Class {
	#name : 'AddExpensePresenter',
	#superclass : 'CpPresenter',
	#instVars : [
		'app'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'rendering' }
AddExpensePresenter >> initialize [ 
 super initialize.
]

{ #category : 'rendering' }
AddExpensePresenter >> onAddGift [ 
    | names |
    names := self model trip participants collect: [ :p | p name ].
    self view addGiftRow: names
]

{ #category : 'rendering' }
AddExpensePresenter >> onCancel [
    app showTrip: self model trip
]

{ #category : 'rendering' }
AddExpensePresenter >> onSave: ann [ 
     |rows  payer payments splitRule expense participantWeights amount |
    rows := ParticipantRowPresenter allInstances 
        select: [:p | p parent = self].
    amount := ann amount asNumber.
    
    payer := self model trip participants
        detect: [ :p | p id value = ann payerId ].
    
    payments := { Payment
        participant: payer
        amount: (Money amount: amount currency: 'EUR') }.
    
    participantWeights := (rows
        select: [ :p | (p isKindOf: ParticipantRowPresenter) and: [ p included ] ])
        collect: [ :p | p participantWeight ].
    
    splitRule := EqualSplitRule among: participantWeights.
    
    expense := Expense
        description: ann description
        totalAmount: (Money amount: amount currency: 'EUR')
        payments: payments
        splitRule: splitRule
        gifts: {}
        date: Date today.
    app addExpense: expense toTrip: self model trip id.
    app showTrip: self model trip
]

{ #category : 'rendering' }
AddExpensePresenter >> renderView [
Transcript show: 'AddExpensePresenter renderView'; cr.
app := self model application.
    self view clearPayer.
    self model trip participants do: [ :p |
        self view addPayerOption: p id value name: p name ].
    self
        renderAllChildViewsForModels: (self model trip participants
            collect: [ :p | ParticipantModel from: p ])
        usingPresenter: ParticipantRowPresenter
        atSlotNamed: #participants
]

{ #category : 'rendering' }
AddExpensePresenter >> viewCreated [

	super viewCreated.
	self view
		when: CpSaveExpenseAnnouncement send: #onSave: to: self;
		when: CpCancelExpenseAnnouncement send: #onCancel to: self;
		when: CpAddGiftRowAnnouncement    send: #onAddGift to: self
]
