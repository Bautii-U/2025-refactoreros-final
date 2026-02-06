"
An instant card that reapplies the last effect used in the game to a selected ship
"
Class {
	#name : 'ProtectorEffect',
	#superclass : 'PermanentCardEffect',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
ProtectorEffect class >> targetedToSquare: aTargetPlayer [

	^ self new initializeTargetedTo: aTargetPlayer
]

{ #category : 'as yet unclassified' }
ProtectorEffect >> canProtect: aShip ownedBy: cardOwner [

	^ (cardOwner = aShip) and: [ targetShip shields > 0 ]
]

{ #category : 'checking' }
ProtectorEffect >> checkTargetShip: aTargetShip [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Protector Card requiers a target ship.' ]
]

{ #category : 'testing' }
ProtectorEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
ProtectorEffect >> initializeTargetedTo: aTargetPlayer [

	targetShip := aTargetPlayer
]

{ #category : 'testing' }
ProtectorEffect >> isCalled: aName [

	^ 'Protector Card' = aName
]

{ #category : 'as yet unclassified' }
ProtectorEffect >> takeDamage [

	targetShip breakAShield.
	
	^ targetShip
]

{ #category : 'actions' }
ProtectorEffect >> targetTo: aTargetShip [

	^ self class targetedToSquare: aTargetShip
]
