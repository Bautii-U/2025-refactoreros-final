"
An instant card that reapplies the last effect used in the game to a selected ship
"
Class {
	#name : 'RepeatEffect',
	#superclass : 'Object',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
RepeatEffect class >> targetedToSquare: aTargetPlayer [

	^ self new initializeTargetedTo: aTargetPlayer
]

{ #category : 'as yet unclassified' }
RepeatEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'as yet unclassified' }
RepeatEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRepeatTo: aTargetShip
]

{ #category : 'as yet unclassified' }
RepeatEffect >> applyThrowEffectFor: aShip [

	^ 0
]

{ #category : 'as yet unclassified' }
RepeatEffect >> canProtect: aShip ownedBy: cardOwner [

	^ false
]

{ #category : 'as yet unclassified' }
RepeatEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [
]

{ #category : 'as yet unclassified' }
RepeatEffect >> checkForTurnRequierementWhen: aShip playsACardDuringTheTurnOf: anotherShip [
]

{ #category : 'checking' }
RepeatEffect >> checkTargetShip: aTargetShip [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Repeat Card requiers a target ship.' ]
]

{ #category : 'as yet unclassified' }
RepeatEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
RepeatEffect >> initializeTargetedTo: aTargetPlayer [

	targetShip := aTargetPlayer
]

{ #category : 'testing' }
RepeatEffect >> isCalled: aName [

	^ 'Repeat Card' = aName
]

{ #category : 'testing' }
RepeatEffect >> isReversalFor: aSquareIndex [

	^ false
]

{ #category : 'as yet unclassified' }
RepeatEffect >> targetTo: aTargetShip [

	^ self class targetedToSquare: aTargetShip
]

{ #category : 'as yet unclassified' }
RepeatEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetedToSquare: aTargetShip
]
