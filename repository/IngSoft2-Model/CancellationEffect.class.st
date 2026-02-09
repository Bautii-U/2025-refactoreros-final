"
An instant card that removes an active permanent card from the game
"
Class {
	#name : 'CancellationEffect',
	#superclass : 'CardEffect',
	#instVars : [
		'targetShip',
		'targetCardName'
	],
	#category : 'IngSoft2-Model-Cards',
	#package : 'IngSoft2-Model',
	#tag : 'Cards'
}

{ #category : 'instance creation' }
CancellationEffect class >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self new
		  initializeTargetedTo: aTargetShip
		  whoPlayed: aTargetCardName
]

{ #category : 'actions' }
CancellationEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyCancellationTo: targetShip whoPlayed: targetCardName
]

{ #category : 'checking' }
CancellationEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Cancellation Card requiers a target ship.' ].

	aTargetCardName ifEmpty: [
		Error signal: 'Cancellation Card requiers a target card.' ]
]

{ #category : 'testing' }
CancellationEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
CancellationEffect >> initializeTargetedTo: aTargetShip whoPlayed: aTargetCardName [

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
