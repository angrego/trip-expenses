Class {
	#name : 'ExpenseModel',
	#superclass : 'CpModel',
	#instVars : [
		'description',
		'amount',
		'date',
		'payers'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'instance creation' }
ExpenseModel class >> from: anExpense [
^ self new
        description: anExpense description;
        amount: anExpense totalAmount printString;
        date: anExpense date printString;
payers:(anExpense payments
            collect: [ :p | p participant name , ' (' , p amount printString , ')' ])
            asArray;
        yourself
]

{ #category : 'accessing' }
ExpenseModel >> amount [

	^ amount
]

{ #category : 'accessing' }
ExpenseModel >> amount: anObject [

	amount := anObject
]

{ #category : 'accessing' }
ExpenseModel >> date [

	^ date
]

{ #category : 'accessing' }
ExpenseModel >> date: anObject [

	date := anObject
]

{ #category : 'accessing' }
ExpenseModel >> description [

	^ description
]

{ #category : 'accessing' }
ExpenseModel >> description: anObject [

	description := anObject
]

{ #category : 'accessing' }
ExpenseModel >> payers [
^	payers 
]

{ #category : 'accessing' }
ExpenseModel >> payers: anObject [

	payers := anObject
]
