Class {
	#name : 'TripDetailView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'web resources' }
TripDetailView class >> style [
    <webResource: #css>
    ^ '@import url("https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css");
    :host { display: block; }'
]

{ #category : 'web resources' }
TripDetailView class >> template [

	    <webResource: #html>
    ^ '
        <ion-app>
            <ion-header>
                <ion-toolbar color="primary">
                    <ion-buttons slot="start">
                        <ion-back-button id="back-btn" default-href="#"></ion-back-button>
                    </ion-buttons>
                    <ion-title id="trip-name"></ion-title>
                    <ion-buttons slot="end">
                        <ion-button id="add-expense-btn">+ Dépense</ion-button>
                    </ion-buttons>
                </ion-toolbar>
            </ion-header>
            <ion-content>
                <p id="trip-total"></p>
                <ion-segment id="tabs" value="expenses">
                    <ion-segment-button value="expenses" id="tab-expenses">
                        <ion-label>Dépenses</ion-label>
                    </ion-segment-button>
                    <ion-segment-button value="balances" id="tab-balances">
                        <ion-label>Balances</ion-label>
                    </ion-segment-button>
                    <ion-segment-button value="bilan" id="tab-bilan">
                        <ion-label>Bilan</ion-label>
                    </ion-segment-button>
                </ion-segment>
                <slot name="content"></div>
            </ion-content>
        </ion-app>
    '
]

{ #category : 'initialization' }
TripDetailView >> initializeShadowRoot [

	super initializeShadowRoot.
	(self shadowedElementWithId: #'back-btn')
		when: CpClickEvent basicPrimary
		send: #onBack
		to: self.
 (self shadowedElementWithId: #'add-expense-btn')
        when: CpClickEvent basicPrimary send: #onAddExpense to: self.
	(self shadowedElementWithId: #'tab-expenses')
		when: CpClickEvent basicPrimary
		send: #onShowExpenses
		to: self.
	(self shadowedElementWithId: #'tab-balances')
		when: CpClickEvent basicPrimary
		send: #onShowBalances
		to: self.
	(self shadowedElementWithId: #'tab-bilan')
		when: CpClickEvent basicPrimary
		send: #onShowBilan
		to: self
]

{ #category : 'initialization' }
TripDetailView >> onAddExpense [
self crTrace: 'onAddExpense View'.
	self serverAnnounce: CpAddExpenseAnnouncement new
]

{ #category : 'initialization' }
TripDetailView >> onBack [
    self serverAnnounce: CpBackAnnouncement new
]

{ #category : 'initialization' }
TripDetailView >> onShowBalances [ 
    self serverAnnounce: CpShowBalancesAnnouncement new
]

{ #category : 'initialization' }
TripDetailView >> onShowBilan [
    self serverAnnounce: CpShowBilanAnnouncement new
]

{ #category : 'initialization' }
TripDetailView >> onShowExpenses [
    self serverAnnounce: CpShowExpensesAnnouncement new
]

{ #category : 'initialization' }
TripDetailView >> renderContent: aString [
    (self shadowedElementWithId: #content) markupContent: aString
]

{ #category : 'initialization' }
TripDetailView >> renderName: aString [
    (self shadowedElementWithId: #'trip-name') textContent: aString
]

{ #category : 'initialization' }
TripDetailView >> renderTotal: aString [
    (self shadowedElementWithId: #'trip-total') textContent: 'Total : ' , aString
]
