Class {
	#name : 'AnObsoleteAddExpensePresenter',
	#superclass : 'CpPresenter',
	#instVars : [
		'app'
	],
	#classInstVars : [
		'trip',
		'appService',
		'onSaveCallback'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'as yet unclassified' }
AnObsoleteAddExpensePresenter class >> on: aTrip service: aService onSave: aBlock [

^ self new
        on: aTrip service: aService onSave: aBlock;
        yourself
]

{ #category : 'as yet unclassified' }
AnObsoleteAddExpensePresenter class >> setTrip: aTrip service: aService [ 
    trip       := aTrip.
    appService := aService
]
