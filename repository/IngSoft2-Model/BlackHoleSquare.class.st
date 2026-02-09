"
A square that resets all ships positions (a dictionary: 'shipName' -> position) to ""1"" (positions from current lap, since this object doesn't receive lap information)
"
Class {
	#name : 'BlackHoleSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'actions' }
BlackHoleSquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

	| isReverted |
	isReverted := aShipManager isSquareRevertedAt: aShip boardPosition.

	isReverted
		ifTrue: [ self applyReversalEffectTo: aShip ]
		ifFalse: [ self applyNormalEffectTo: aShip ].

	^ true
]

{ #category : 'actions' }
BlackHoleSquare >> applyNormalEffectTo: aShip [

	aShip moveBackwardsBy: 4
]

{ #category : 'actions' }
BlackHoleSquare >> applyReversalEffectTo: aShip [

	aShip moveForwardBy: 4
]
