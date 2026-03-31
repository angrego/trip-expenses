Class {
	#name : 'PayerOptionPresenter',
	#superclass : 'CpPresenter',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'rendering' }
PayerOptionPresenter >> renderView [ 
    self view 
        renderId: self model id value
        name: self model name
]
