Class {
	#name : 'ParticipantRowView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'web resources' }
ParticipantRowView class >> style [ 
  <webResource: #css>
    ^ '@import url("https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css");
    :host { display: block; }'
]

{ #category : 'web resources' }
ParticipantRowView class >> template [ 
    <webResource: #html>
    ^ '
        <input type="checkbox" id="included"/>
        <span id="name"></span>
        <input type="number" id="weight" value="1" min="1" max="10"/>
    '
]

{ #category : 'initialization' }
ParticipantRowView >> initializeShadowRoot [

	super initializeShadowRoot.
	(self shadowedElementWithId: #included)
		when: CpChangeEvent 
		send: #onIncludedChanged
		to: self.
	(self shadowedElementWithId: #weight)
		when: CpChangeEvent 
		send: #onWeightChanged
		to: self
]

{ #category : 'initialization' }
ParticipantRowView >> onIncludedChanged [ 
 | ann |
    ann := CpIncludedChangedAnnouncement new.
    ann included: ((self shadowedElementWithId: #included) hasAttributeAt: 'checked').
    self serverAnnounce: ann
		
	
]

{ #category : 'initialization' }
ParticipantRowView >> onWeightChanged [
    | ann val |
    ann := CpWeightChangedAnnouncement new.
    val := (self shadowedElementWithId: #weight) propertyAt: 'value'.
    ann weight: val asNumber .
    self serverAnnounce: ann
		
	
]

{ #category : 'initialization' }
ParticipantRowView >> renderIncluded: aBoolean [
 | input |
    input := self shadowedElementWithId: #included.
    aBoolean
        ifTrue: [ input attributeAt: 'checked' put: '' ]
        ifFalse: [ input removeAttributeAt: 'checked' ]
]

{ #category : 'initialization' }
ParticipantRowView >> renderName: aString [
    (self shadowedElementWithId: #name) textContent: aString
]

{ #category : 'initialization' }
ParticipantRowView >> renderWeight: aNumber [
    (self shadowedElementWithId: #weight) 
        attributeAt: 'value' put: aNumber printString
]
