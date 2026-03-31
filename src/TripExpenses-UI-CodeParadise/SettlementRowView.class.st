Class {
	#name : 'SettlementRowView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'web resources' }
SettlementRowView class >> style [ 
    <webResource: #css>
    ^ '@import url("https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css");
       :host { display: block; }'

]

{ #category : 'web resources' }
SettlementRowView class >> template [

	<webResource: #html>
	^ '<ion-item>
        <ion-label>
            <h3><span id="from"></span> -> <span id="to"></span></h3>
        </ion-label>
        <ion-note slot="end" id="amount"></ion-note>
       </ion-item>'
]

{ #category : 'rendering' }
SettlementRowView >> renderAmount: aString [
    (self shadowedElementWithId: #amount) textContent: aString
]

{ #category : 'as yet unclassified' }
SettlementRowView >> renderFrom: aString [
    (self shadowedElementWithId: #from) textContent: aString
]

{ #category : 'as yet unclassified' }
SettlementRowView >> renderTo: aString [
    (self shadowedElementWithId: #to) textContent: aString
]
