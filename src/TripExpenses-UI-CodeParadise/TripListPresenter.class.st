Class {
	#name : 'TripListPresenter',
	#superclass : 'CpPresenter',
	#instVars : [
		'appService'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'initialization' }
TripListPresenter >> initialize [
    super initialize.
    appService := TripApplicationService default
]

{ #category : 'initialization' }
TripListPresenter >> renderContentOn: html [
    html div
        class: 'trip-list';
        with: [
            appService allTrips do: [ :trip |
                html div
                    class: 'trip-card';
                    with: [
                        html h2: trip name.
                        html p: trip totalExpenses printString.
                        html button
                            onClick: [ self showTrip: trip ];
                            with: 'Voir' ] ] ]
]
