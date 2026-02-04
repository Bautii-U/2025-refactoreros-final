"
An instant card that reapplies the last effect used in the game to a selected ship
"
Class {
	#name : 'ProtectorEffect',
	#superclass : 'Object',
	#instVars : [
		'protectorShip'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
ProtectorEffect class >> targetedTo: aTargetPlayer [

	^ self new intializeTargetedTo: aTargetPlayer
]

{ #category : 'actions' }
ProtectorEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
ProtectorEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [
]

{ #category : 'actions' }
ProtectorEffect >> applyThrowEffectFor: aShip [

	^ 0
]

{ #category : 'testing' }
ProtectorEffect >> canProtect: aShip ownedBy: cardOwner [

	^ (cardOwner = aShip) and: [ protectorShip shields > 0 ]
]

{ #category : 'checking' }
ProtectorEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [
]

{ #category : 'checking' }
ProtectorEffect >> checkForTurnRequierementWhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
]

{ #category : 'checking' }
ProtectorEffect >> checkTargetShip: aTargetShip [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Protector Card requiers a target ship.' ]
]

{ #category : 'testing' }
ProtectorEffect >> hasTarget: aShip [

	^ protectorShip = aShip
]

{ #category : 'initialization' }
ProtectorEffect >> intializeTargetedTo: aTargetPlayer [

	protectorShip := aTargetPlayer
]

{ #category : 'testing' }
ProtectorEffect >> isCalled: aName [

	^ 'Protector Card' = aName
]

{ #category : 'actions' }
ProtectorEffect >> takeDamage [

	protectorShip breakAShield
]

{ #category : 'actions' }
ProtectorEffect >> targetTo: aTargetShip [

	^ self class targetedTo: aTargetShip
]

{ #category : 'actions' }
ProtectorEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetedTo: aTargetShip
]
