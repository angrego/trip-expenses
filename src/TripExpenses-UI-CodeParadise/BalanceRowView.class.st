Class {
	#name : 'BalanceRowView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'web resources' }
BalanceRowView class >> style [
    <webResource: #css>
    ^ '@import url("https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css");
       :host { display: block; }'
]

{ #category : 'web resources' }
BalanceRowView class >> template [ 
    <webResource: #html>
    ^ '<ion-item>
        <ion-label id="name"></ion-label>
        <ion-note slot="end" id="amount"></ion-note>
       </ion-item>'
]

{ #category : 'rendering' }
BalanceRowView >> renderAmount: aString positive: aBoolean [ 
    | note |
    note := self shadowedElementWithId: #amount.
    note textContent: aString.
    note attributeAt: 'color' put: (aBoolean ifTrue: [ 'success' ] ifFalse: [ 'danger' ])
]

{ #category : 'rendering' }
BalanceRowView >> renderName: aString [
    (self shadowedElementWithId: #name) textContent: aString
]
