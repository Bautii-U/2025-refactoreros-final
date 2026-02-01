Class {
	#name : 'CancellationEffect',
	#superclass : 'Object',
	#instVars : [
		'targetShip',
		'targetCardName'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
CancellationEffect class >> targetTo: aTargetShip whoPlayed: aTargetCardName [
	^ self new intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName
]

{ #category : 'actions' }
CancellationEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
CancellationEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [
	aGame applyCancellationTo: targetShip whoPlayed: targetCardName
]

{ #category : 'actions' }
CancellationEffect >> applyThrowEffectFor: aShip [
	^ 0
	
]

{ #category : 'checking' }
CancellationEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Cancellation Card requiers a target ship.' ].

	aTargetCardName ifEmpty: [
		Error signal: 'Cancellation Card requiers a target card.' ]
]

{ #category : 'checking' }
CancellationEffect >> checkForTurnRequierementwhen: aShip playsACardDuringTheTurnOf: anotherShip [
]

{ #category : 'testing' }
CancellationEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
CancellationEffect >> intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName [

	targetShip := aTargetShip.
	targetCardName := aTargetCardName
]

{ #category : 'testing' }
CancellationEffect >> isCalled: aName [

	^ 'Cancellation Card' = aName
]

{ #category : 'actions' }
CancellationEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetTo: aTargetShip whoPlayed: aTargetCardName
]
