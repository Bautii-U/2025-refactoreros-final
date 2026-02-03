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
RepeatEffect class >> targetedTo: aTargetPlayer [
	^ self new intializeTargetedTo: aTargetPlayer
]

{ #category : 'actions' }
RepeatEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
RepeatEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRepeatTo: aTargetShip
]

{ #category : 'actions' }
RepeatEffect >> applyThrowEffectFor: aShip [

	^ 0
]

{ #category : 'checking' }
RepeatEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [
]

{ #category : 'checking' }
RepeatEffect >> checkForTurnRequierementWhen: aShip playsACardDuringTheTurnOf: anotherShip [
]

{ #category : 'checking' }
RepeatEffect >> checkTargetShip: aTargetShip [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Repeat Card requiers a target ship.' ]
]

{ #category : 'testing' }
RepeatEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
RepeatEffect >> intializeTargetedTo: aTargetPlayer [

	targetShip := aTargetPlayer
]

{ #category : 'testing' }
RepeatEffect >> isCalled: aName [

	^ 'Repeat Card' = aName
]

{ #category : 'actions' }
RepeatEffect >> targetTo: aTargetShip [

	^ self class targetedTo: aTargetShip
]

{ #category : 'actions' }
RepeatEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetedTo: aTargetShip
]
