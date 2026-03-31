Class {
	#name : 'BalanceModel',
	#superclass : 'CpModel',
	#instVars : [
		'participantName',
		'amount',
		'isPositive'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'as yet unclassified' }
BalanceModel class >> participant: aParticipant amount: aMoney [ 
    ^ self new
        participantName: aParticipant name;
        amount: aMoney printString;
		isPositive: aMoney isPositive;
        yourself
]

{ #category : 'accessing' }
BalanceModel >> amount [

	^ amount
]

{ #category : 'accessing' }
BalanceModel >> amount: anObject [

	amount := anObject
]

{ #category : 'accessing' }
BalanceModel >> isPositive [

^	isPositive 
]

{ #category : 'accessing' }
BalanceModel >> isPositive:  aBoolean [

	isPositive := aBoolean 
]

{ #category : 'accessing' }
BalanceModel >> participantName [

	^ participantName
]

{ #category : 'accessing' }
BalanceModel >> participantName: anObject [

	participantName := anObject
]
