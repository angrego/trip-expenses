Class {
	#name : 'TripExpensesApplicationView',
	#superclass : 'CpView',
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'web resources' }
TripExpensesApplicationView class >> style [ 
<webResource: #css>
  ^ '@import url("https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css");
    :host { display: block; }'
]

{ #category : 'web resources' }
TripExpensesApplicationView class >> template [

  <webResource: #html>
    ^ '
        <ion-app>
            <ion-header>
                <ion-toolbar color="primary">
                    <ion-title>Mes voyages</ion-title>
                </ion-toolbar>
            </ion-header>
            <ion-content>
                <slot name="trips"></slot>
            </ion-content>
        </ion-app>
    '
]
