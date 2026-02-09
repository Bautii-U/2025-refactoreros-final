"
A square that increases landed ship position in ""4"" squares. (Positions: a dictionary: 'shipName' -> position; positions from current lap, since this object doesn't receive lap information)
"
Class {
	#name : 'HyperSpaceJumpSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'actions' }
HyperSpaceJumpSquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

	| isReverted |
	isReverted := aShipManager isSquareRevertedAt: aShip boardPosition.

	isReverted
		ifTrue: [ self applyReversalEffectTo: aShip ]
		ifFalse: [ self applyNormalEffectTo: aShip ].

	^ true
]

{ #category : 'actions' }
HyperSpaceJumpSquare >> applyNormalEffectTo: aShip [

	aShip moveForwardBy: 4.
	aShip breakAShield.
]

{ #category : 'actions' }
HyperSpaceJumpSquare >> applyReversalEffectTo: aShip [

	aShip moveBackwardsBy: 4.
	aShip restoreAShield.
]
