Class {
	#name : 'ParicipantWeightTest',
	#superclass : 'TestCase',
	#instVars : [
		'greg'
	],
	#category : 'TripExpenses-Domain-Tests',
	#package : 'TripExpenses-Domain-Tests'
}

{ #category : 'running' }
ParicipantWeightTest >> setUp [

	greg := Participant name: 'Greg'
]

{ #category : 'running' }
ParicipantWeightTest >> testCustomWeight [
    | pw |
    pw := ParticipantWeight participant: greg weight: 2.
    self assert: pw weight    equals: 2.
    self assert: pw participant equals: greg 
]

{ #category : 'running' }
ParicipantWeightTest >> testDefaultWeightIsOne [
    | pw |
    pw := ParticipantWeight participant: greg.
    self assert: pw weight equals: 1
]

{ #category : 'running' }
ParicipantWeightTest >> testNegativeWeightRaisesError [ 
    self should: [ ParticipantWeight participant: greg weight: -1 ] raise: Error
]

{ #category : 'running' }
ParicipantWeightTest >> testZeroWeightRaisesError [
    self should: [ ParticipantWeight participant: greg weight: 0 ] raise: Error
]
