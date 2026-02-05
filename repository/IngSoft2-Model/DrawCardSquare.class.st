"
A square that gives a new random card to a ship
"
Class {
	#name : 'DrawCardSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model-SquareType',
	#package : 'IngSoft2-Model',
	#tag : 'SquareType'
}

{ #category : 'actions' }
DrawCardSquare >> applyEffectTo: shipList forShip: aShip on: aBoard managedBy: aShipManager [

	| isReverted |
	isReverted := aShipManager isSquareRevertedAt: aShip boardPosition.

	isReverted
		ifTrue: [ aBoard discardRandomCardTo: aShip ]
		ifFalse: [ aBoard giveRandomCardTo: aShip ].

	^ true
]
