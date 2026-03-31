Class {
	#name : 'ExpenseRowView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'web resources' }
ExpenseRowView class >> style [
    <webResource: #css>
    ^ '@import url("https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css");
       :host { display: block; }'
]

{ #category : 'web resources' }
ExpenseRowView class >> template [

 <webResource: #html>
    ^ '<ion-item>
        <ion-label>
            <h3 id="description"></h3>
            <p id="payers"></p>
            <p id="date"></p>
        </ion-label>
        <ion-note slot="end" id="amount"></ion-note>
       </ion-item>'
]

{ #category : 'rendering' }
ExpenseRowView >> renderAmount: aString [
    (self shadowedElementWithId: #amount) textContent: aString
]

{ #category : 'rendering' }
ExpenseRowView >> renderDate: aString [
    (self shadowedElementWithId: #date) textContent: aString
]

{ #category : 'rendering' }
ExpenseRowView >> renderDescription: aString [
    (self shadowedElementWithId: #description) textContent: aString
]

{ #category : 'rendering' }
ExpenseRowView >> renderPayers: aString [ 
    (self shadowedElementWithId: #payers) textContent: aString
]
