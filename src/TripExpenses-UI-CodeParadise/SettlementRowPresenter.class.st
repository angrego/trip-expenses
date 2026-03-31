Class {
	#name : 'SettlementRowPresenter',
	#superclass : 'CpPresenter',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'rendering' }
SettlementRowPresenter >> renderView [
    self view
        renderFrom: self model from;
        renderTo: self model to;
        renderAmount: self model amount
]
