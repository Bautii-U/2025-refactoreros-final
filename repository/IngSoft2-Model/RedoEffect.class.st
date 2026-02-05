"
A card that mimics the effect of the last played card, regardless of its type (instant or permanent)
"
Class {
	#name : 'RedoEffect',
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
RedoEffect class >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self new
		  intializeTargetedTo: aTargetShip
		  whoPlayed: aTargetCardName
]

{ #category : 'instance creation' }
RedoEffect class >> targetedToSquare: aTargetPlayer [

	^ self new intializeTargetedTo: aTargetPlayer whoPlayed: ''
]

{ #category : 'actions' }
RedoEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
RedoEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRedoTo: aTargetShip from: owner whoPlayed: targetCardName
]

{ #category : 'actions' }
RedoEffect >> applyThrowEffectFor: aShip [

	^ 0
]

{ #category : 'testing' }
RedoEffect >> canProtect: aShip ownedBy: cardOwner [

	^ false
]

{ #category : 'checking' }
RedoEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [

]

{ #category : 'checking' }
RedoEffect >> checkForTurnRequierementWhen: aShip playsACardDuringTheTurnOf: anotherShip [
]

{ #category : 'checking' }
RedoEffect >> checkTargetShip: aTargetShip [
]

{ #category : 'testing' }
RedoEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
RedoEffect >> intializeTargetedTo: aTargetShip whoPlayed: aTargetCardName [

	targetShip := aTargetShip.
	targetCardName := aTargetCardName
]

{ #category : 'testing' }
RedoEffect >> isCalled: aName [

	^ 'Redo Card' = aName
]

{ #category : 'actions' }
RedoEffect >> targetTo: aTargetShip [

	^ self class targetedToSquare: aTargetShip
]

{ #category : 'actions' }
RedoEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetTo: aTargetShip whoPlayed: aTargetCardName
]
