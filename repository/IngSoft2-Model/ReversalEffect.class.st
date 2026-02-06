"
An instant card that reapplies the last effect used in the game to a selected ship
"
Class {
	#name : 'ReversalEffect',
	#superclass : 'PermanentCardEffect',
	#instVars : [
		'targetSquareIndex'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
ReversalEffect class >> targetedTo: aSquareIndex [

	^ self new initializeTargetedTo: aSquareIndex
]

{ #category : 'actions' }
ReversalEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [
]

{ #category : 'checking' }
ReversalEffect >> checkTargetShip: aTargetShip [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Protector Card requiers a target ship.' ]
]

{ #category : 'as yet unclassified' }
ReversalEffect >> checkTargetSquare: aSquareIndex [

	aSquareIndex > 0 ifFalse: [
		Error signal: 'Reversal Card requires a valid square index.' ]
]

{ #category : 'initialization' }
ReversalEffect >> initializeTargetedTo: aSquareIndex [

	targetSquareIndex := aSquareIndex
]

{ #category : 'testing' }
ReversalEffect >> isCalled: aName [

	^ 'Reversal Card' = aName
]

{ #category : 'as yet unclassified' }
ReversalEffect >> isReversalFor: aSquareIndex [

	^ targetSquareIndex = aSquareIndex
]

{ #category : 'actions' }
ReversalEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetedTo: aTargetShip
]

{ #category : 'actions' }
ReversalEffect >> targetedTo: aSquareIndex [

	self checkTargetSquare: aSquareIndex.
	
	^ self class targetedTo: aSquareIndex 
]
