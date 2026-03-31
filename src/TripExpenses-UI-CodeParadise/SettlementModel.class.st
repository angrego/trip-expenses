Class {
	#name : 'SettlementModel',
	#superclass : 'CpModel',
	#instVars : [
		'from',
		'to',
		'amount'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'instance creation' }
SettlementModel class >> from: aSettlement [
    ^ self new
        from: aSettlement from name;
        to: aSettlement to name;
        amount: aSettlement amount printString;
        yourself
]

{ #category : 'accessing' }
SettlementModel >> amount [

	^ amount
]

{ #category : 'accessing' }
SettlementModel >> amount: anObject [

	amount := anObject
]

{ #category : 'accessing' }
SettlementModel >> from [

	^ from
]

{ #category : 'accessing' }
SettlementModel >> from: anObject [

	from := anObject
]

{ #category : 'accessing' }
SettlementModel >> to [

	^ to
]

{ #category : 'accessing' }
SettlementModel >> to: anObject [

	to := anObject
]
