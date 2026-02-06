"
An instant card that reapplies the last effect used in the game to a selected ship
"
Class {
	#name : 'RepeatEffect',
	#superclass : 'CardEffect',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
RepeatEffect class >> targetedTo: aTargetPlayer [

	^ self new initializeTargetedTo: aTargetPlayer
]

{ #category : 'actions' }
RepeatEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRepeatTo: aTargetShip
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
RepeatEffect >> initializeTargetedTo: aTargetPlayer [

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
