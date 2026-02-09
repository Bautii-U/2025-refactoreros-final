"
Encapsulates a ship's position at the Game board, and lap count. 
"
Class {
	#name : 'Position',
	#superclass : 'Object',
	#instVars : [
		'lap',
		'lapLength',
		'square'
	],
	#category : 'IngSoft2-Model-Game',
	#package : 'IngSoft2-Model',
	#tag : 'Game'
}

{ #category : 'accessing' }
Position class >> at: aPosition lap: aLap andLapLength: aLapLength [

	^ self new initializeWith: aPosition and: aLap and: aLapLength
]

{ #category : 'accessing' }
Position class >> atStartOfLapWithSquareNumbers: aLapLength [

	^ self new initializeWith: 1 and: 0 and: aLapLength
]

{ #category : 'arithmetic' }
Position >> decreaseBy: aSquareDistance [

	| newPosition newLap lapsGoneBackwards squaresGoneBackwards |
	newPosition := square - aSquareDistance.
	newLap := lap.


	newPosition <= 0 ifTrue: [
		lapsGoneBackwards := (newPosition // lapLength) abs.
		squaresGoneBackwards := newPosition abs % lapLength.

		newPosition := lapLength - squaresGoneBackwards.
		newLap := lap - lapsGoneBackwards.

		squaresGoneBackwards = 0 ifFalse: [ newLap := lap - 1 ].

		newLap := newLap max: 0 ].

	^ self class at: newPosition lap: newLap andLapLength: lapLength
]

{ #category : 'actions' }
Position >> goToStartOfLap [

	| newPosition |
	newPosition := 1.

	^ self class at: newPosition lap: lap andLapLength: lapLength
]

{ #category : 'comparing' }
Position >> hasEqualPosition: aPositon [

	^ square = aPositon square
]

{ #category : 'arithmetic' }
Position >> increaseBy: aSquareDistance [

	| newPosition newLap |
	newPosition := aSquareDistance + square - 1 % lapLength + 1.
	newLap := lap + (aSquareDistance + square - 1 // lapLength).

	^ self class at: newPosition lap: newLap andLapLength: lapLength
]

{ #category : 'initialization' }
Position >> initializeWith: aSquare and: aLap and: aLapLength [

	square := aSquare.
	lap := aLap.
	lapLength := aLapLength
]

{ #category : 'comparing' }
Position >> isGreaterThan: anotherPosition [

	| positionAsOnlySquares |
	positionAsOnlySquares := anotherPosition square
	                         + (anotherPosition lap * lapLength).

	^ square + (lap * lapLength) > positionAsOnlySquares
]

{ #category : 'accessing' }
Position >> lap [

	^ lap
]

{ #category : 'accessing' }
Position >> square [

	^ square
]
