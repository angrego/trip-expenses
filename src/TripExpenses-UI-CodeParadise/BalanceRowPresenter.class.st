Class {
	#name : 'BalanceRowPresenter',
	#superclass : 'CpPresenter',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'rendering' }
BalanceRowPresenter >> renderAmount: aString positive: aBoolean [
    | note |
    note := self shadowedElementWithId: #amount.
    note textContent: aString.
    note attributeAt: 'color' put: (aBoolean ifTrue: [ 'success' ] ifFalse: [ 'danger' ])
]

{ #category : 'rendering' }
BalanceRowPresenter >> renderView [
    self view
        renderName: self model participantName;
        renderAmount: self model amount
        positive: self model  isPositive
]
