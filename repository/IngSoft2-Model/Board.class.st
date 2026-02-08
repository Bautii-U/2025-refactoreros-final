"
Contains collaborators that can be used for creating multiple games. 
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'parsecs',
		'deck'
	],
	#category : 'IngSoft2-Model-Game',
	#package : 'IngSoft2-Model',
	#tag : 'Game'
}

{ #category : 'validation' }
Board class >> checkValidSquareCount: aSquareCount [

	aSquareCount >= 2 ifFalse: [
		Error signal: 'Square count should be equal or higher than 2' ]
]

{ #category : 'instance creation' }
Board class >> populatedBy: aSquareGenerator anAmountOf: aNumberOfSquares withTotalDistanceOf: aDistance [

	| aSetOfSquares |
	aSetOfSquares := aSquareGenerator createSquares: aNumberOfSquares.

	self checkValidSquareCount: aNumberOfSquares.

	^ self new
		  initializePopulatedOf: aSetOfSquares
		  withDistanceOf: aDistance toParsecs
		  withDeck: OrderedCollection new
]

{ #category : 'instance creation' }
Board class >> populatedOf: aSetOfSquares withTotalDistanceOf: aDistance [

	^ self new
		  initializePopulatedOf: aSetOfSquares
		  withDistanceOf: aDistance toParsecs
		  withDeck: OrderedCollection new
]

{ #category : 'instance creation' }
Board class >> populatedOf: aSetOfSquares withTotalDistanceOf: aDistance withDeck: aCollectionOfCards [

	^ self new
		  initializePopulatedOf: aSetOfSquares
		  withDistanceOf: aDistance toParsecs
		  withDeck: aCollectionOfCards
]

{ #category : 'actions' }
Board >> discardRandomCardTo: aShip [

	aShip discardRandomCard
]

{ #category : 'actions' }
Board >> giveRandomCardTo: aShip [

	| card |
	card := deck atRandom deepCopy.
	aShip drawCard: card
]

{ #category : 'initialization' }
Board >> initializePopulatedOf: aSetOfSquares withDistanceOf: aNumberOfParsecs withDeck: aCollectionOfCards [

	squares := aSetOfSquares deepCopy.
	parsecs := aNumberOfParsecs.
	deck := aCollectionOfCards
]

{ #category : 'accessing' }
Board >> numberOfSquares [

	^ squares size
]

{ #category : 'accessing' }
Board >> parsecsPerSquare [

	^ parsecs / squares size
]

{ #category : 'accessing' }
Board >> squareAt: aPosition [

	^ squares at: aPosition
]
