Class {
	#name : 'TripCardView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'as yet unclassified' }
TripCardView class >> style [

  <webResource: #css>
    ^ '@import url("https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css");
    :host { display: block; }'
]

{ #category : 'as yet unclassified' }
TripCardView class >> template [
  <webResource: #html>
    ^ '
        <ion-card>
            <ion-card-header>
                <ion-card-title id="name"></ion-card-title>
            </ion-card-header>
            <ion-card-content>
                <p id="total"></p>
                <p id="participants"></p>
                <ion-button id="openBtn" expand="block">Voir</ion-button>
            </ion-card-content>
        </ion-card>
    '
]

{ #category : 'initialization' }
TripCardView >> initializeShadowRoot [

	super initializeShadowRoot.
	(self shadowedElementWithId: #openBtn)
		when: CpClickEvent basicPrimary
		send: #onOpenTrip
		to: self
]

{ #category : 'initialization' }
TripCardView >> onOpenTrip [

	self serverAnnounce: CpOpenTripAnnouncement
]

{ #category : 'initialization' }
TripCardView >> renderName: aString [

(self shadowedElementWithId: #name) textContent: aString
]

{ #category : 'initialization' }
TripCardView >> renderParticipants: aString [

	(self shadowedElementWithId: #participants) textContent: aString
]

{ #category : 'initialization' }
TripCardView >> renderTotal: aString [

  (self shadowedElementWithId: #total) textContent: aString
]
