Class {
	#name : 'ParticipantOptionView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'web resources' }
ParticipantOptionView class >> template [ 
    <webResource: #html>
   ^ '<option id="opt"></option>'
]

{ #category : 'rendering' }
ParticipantOptionView >> renderId: anId name: aName [
   | opt |
    opt := self shadowedElementWithId: #opt.
    opt attributeAt: 'value' put:anId.
    opt textContent: aName
]
