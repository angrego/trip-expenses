Class {
	#name : 'PayerOptionView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'web resources' }
PayerOptionView class >> template [
    <webResource: #html>
    ^ '<option id="opt"></option>'
]

{ #category : 'rendering' }
PayerOptionView >> renderId: anId name: aName [ 
    | opt |
    opt := self shadowedElementWithId: #opt.
    opt attributeAt: 'value' put: anId.
    opt textContent: aName
]
