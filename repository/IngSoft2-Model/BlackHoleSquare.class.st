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
		ifTrue: [ self applyReversalEffectTo: shipList for: aShip ]
		ifFalse: [ self applyNormalEffectTo: shipList forShip: aShip ].

	^ true
]

{ #category : 'actions' }
BlackHoleSquare >> applyNormalEffectTo: shipList forShip: aShip [

	aShip moveBackwardsBy: 4
]

{ #category : 'actions' }
BlackHoleSquare >> applyReversalEffectTo: shipList for: aShip [

	aShip moveForwardBy: 4
]
