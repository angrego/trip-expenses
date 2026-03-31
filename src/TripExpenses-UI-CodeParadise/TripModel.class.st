Class {
	#name : 'TripModel',
	#superclass : 'CpModel',
	#instVars : [
		'trip',
		'application'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'instance creation' }
TripModel class >> on: aTrip [
    ^ self new trip: aTrip; yourself
]

{ #category : 'accessing' }
TripModel >> application [
^application
]

{ #category : 'accessing' }
TripModel >> application:anApplicaton [
application:=anApplicaton 
]

{ #category : 'accessing' }
TripModel >> balances [       
^trip balances       
]

{ #category : 'accessing' }
TripModel >> currency [
^trip currency
]

{ #category : 'accessing' }
TripModel >> expenses [
^trip expenses
]

{ #category : 'accessing' }
TripModel >> generosityReport [        
^trip generosityReport        
]

{ #category : 'accessing' }
TripModel >> id [        
^trip id
]

{ #category : 'accessing' }
TripModel >> name [
^trip name
]

{ #category : 'accessing' }
TripModel >> participants [
^trip participants
]

{ #category : 'accessing' }
TripModel >> preferredPresenterClass [
    ^ TripCardPresenter
]

{ #category : 'accessing' }
TripModel >> settlements [       
^trip settlements       
]

{ #category : 'accessing' }
TripModel >> totalExpenses [ 
^trip totalExpenses 
]

{ #category : 'accessing' }
TripModel >> trip [ 
^ trip
]

{ #category : 'accessing' }
TripModel >> trip: aTrip [ 
trip := aTrip
]
