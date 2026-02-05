"
An instant card that reapplies the last effect used in the game to a selected ship
"
Class {
	#name : 'ReversalEffect',
	#superclass : 'Object',
	#instVars : [
		'targetSquareIndex'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
ReversalEffect class >> targetedToSquare: aSquareIndex [

	^ self new intializeTargetedTo: aSquareIndex
]

{ #category : 'actions' }
ReversalEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
ReversalEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [
]

{ #category : 'actions' }
ReversalEffect >> applyThrowEffectFor: aShip [

	^ 0
]

{ #category : 'testing' }
ReversalEffect >> canProtect: aShip ownedBy: cardOwner [

	^ false
]

{ #category : 'checking' }
ReversalEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [
]

{ #category : 'checking' }
ReversalEffect >> checkForTurnRequierementWhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
]

{ #category : 'checking' }
ReversalEffect >> checkTargetShip: aTargetShip [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Protector Card requiers a target ship.' ]
]

{ #category : 'checking' }
ReversalEffect >> checkTargetSquare: aSquareIndex [

	"aSquareIndex > 0 ifFalse: [ Error signal: ]"
]

{ #category : 'testing' }
ReversalEffect >> hasTarget: aShip [

	^ targetSquareIndex = aShip
]

{ #category : 'initialization' }
ReversalEffect >> intializeTargetedTo: aSquareIndex [

	targetSquareIndex := aSquareIndex
]

{ #category : 'testing' }
ReversalEffect >> isCalled: aName [

	^ 'Reversal Card' = aName
]

{ #category : 'testing' }
ReversalEffect >> isReversalFor: aSquareIndex [

	^ targetSquareIndex = aSquareIndex
]

{ #category : 'actions' }
ReversalEffect >> targetTo: aTargetShip [

	^ self class targetedToSquare: aTargetShip
]

{ #category : 'actions' }
ReversalEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetedToSquare: aTargetShip
]

{ #category : 'actions' }
ReversalEffect >> targetedToSquare: aSquareIndex [

	self checkTargetSquare: aSquareIndex.
	
	^ self class targetedToSquare: aSquareIndex 
]
