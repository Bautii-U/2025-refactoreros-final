"
Abstract base class defining the default behavior for all card effects, providing safe 'do nothing' hooks. Subclasses override specific methods to implement unique card logic without duplicating code.
"
Class {
	#name : 'CardEffect',
	#superclass : 'Object',
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'actions' }
CardEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
CardEffect >> applyPlayedEffectIn: aGame from: owner to: aTarget [
]

{ #category : 'actions' }
CardEffect >> applyThrowEffectFor: aShip [

	^ 0
]

{ #category : 'testing' }
CardEffect >> canProtect: aShip ownedBy: cardOwner [

	^ false
]

{ #category : 'checking' }
CardEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [
]

{ #category : 'checking' }
CardEffect >> checkForTurnRequierementWhen: aShip playsACardDuringTheTurnOf: anotherShip [
]

{ #category : 'checking' }
CardEffect >> checkTargetShip: aTargetShip [
]

{ #category : 'checking' }
CardEffect >> checkTargetSquare: aSquareIndex [
]

{ #category : 'testing' }
CardEffect >> hasTarget: aShip [

	^ false
]

{ #category : 'testing' }
CardEffect >> isCalled: aName [
]

{ #category : 'testing' }
CardEffect >> isReversalFor: aSquareIndex [

	^ false
]

{ #category : 'actions' }
CardEffect >> takeDamage [
]

{ #category : 'actions' }
CardEffect >> targetTo: aTargetShip [ 

	^ self

]

{ #category : 'actions' }
CardEffect >> targetTo: aTargetShip whoPlayed: aCardName [

	^ self targetTo: aTargetShip
]

{ #category : 'actions' }
CardEffect >> targetedTo: aSquareIndex [

	^ self

]
