Class {
	#name : 'ExpenseRowPresenter',
	#superclass : 'CpPresenter',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'rendering' }
ExpenseRowPresenter >> renderView [

	self view
		renderDescription: self model description;
		renderAmount: self model amount;
		renderDate: self model date;
		renderPayers: (', ' join: self model payers)
]
