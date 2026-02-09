"
A square that makes the ship advances M parsecs forward, following list values.
"
Class {
	#name : 'HyperJumpSquare',
	#superclass : 'Object',
	#instVars : [
		'rewards',
		'currentRewardIndex'
	],
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'actions' }
HyperJumpSquare class >> checkRewards: aParsecsList [

	aParsecsList ifEmpty: [
		Error signal: 'Parsec rewards cannot be empty' ]
]

{ #category : 'actions' }
HyperJumpSquare class >> withRewards: aSetOfDistances [

	self checkRewards: aSetOfDistances.

	^ self new initializeWithRewards: aSetOfDistances
]

{ #category : 'actions' }
HyperJumpSquare >> advanceRewardIndex [

	currentRewardIndex := currentRewardIndex + 1.
	currentRewardIndex > rewards size ifTrue: [ currentRewardIndex := 1 ].
]

{ #category : 'actions' }
HyperJumpSquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

	| distanceInSquares isReverted |
	distanceInSquares := (rewards at: currentRewardIndex) toParsecs // aBoard parsecsPerSquare.
	isReverted := aShipManager isSquareRevertedAt: aShip boardPosition.

	isReverted
		ifTrue: [ self applyReversalEffectTo: aShip distance: distanceInSquares ]
		ifFalse: [ self applyNormalEffectTo: aShip distance: distanceInSquares ].
	
	self advanceRewardIndex.

	^ true
]

{ #category : 'actions' }
HyperJumpSquare >> applyNormalEffectTo: aShip distance: aDistance [

	aShip moveForwardBy: aDistance

	
]

{ #category : 'actions' }
HyperJumpSquare >> applyReversalEffectTo: aShip distance: aDistance [

	aShip moveBackwardsBy: aDistance

	
]

{ #category : 'initialization' }
HyperJumpSquare >> initializeWithRewards: aSetOfDistances [

	rewards := (aSetOfDistances asSortedCollection: [ :aDistance :anotherDistance | aDistance toParsecs > anotherDistance toParsecs])
		               asArray.
	currentRewardIndex := 1
]
