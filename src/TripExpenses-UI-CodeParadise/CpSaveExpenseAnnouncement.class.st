Class {
	#name : 'CpSaveExpenseAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'description',
		'amount',
		'payerId',
		'participantWeights',
		'gifts'
	],
	#category : 'TripExpenses-UI-CodeParadise',
	#package : 'TripExpenses-UI-CodeParadise'
}

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> amount [ 
 ^ amount
]

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> amount: n [
 amount := n
]

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> description [ 
 ^ description 
]

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> description: s [ 
 description := s
]

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> gifts [
  ^ gifts 
]

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> gifts: c [ 
gifts := c 
]

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> participantWeights [ 
 ^ participantWeights
]

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> participantWeights: c [
  participantWeights := c 
]

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> payerId [ 
^ payerId 
]

{ #category : 'accessing' }
CpSaveExpenseAnnouncement >> payerId: s [ 
 payerId := s 
]
