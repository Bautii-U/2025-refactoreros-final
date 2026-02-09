"
A card that mimics the effect of the last played card, regardless of its type (instant or permanent)
"
Class {
	#name : 'RedoEffect',
	#superclass : 'CardEffect',
	#instVars : [
		'target',
		'targetCardName'
	],
	#category : 'IngSoft2-Model-Cards',
	#package : 'IngSoft2-Model',
	#tag : 'Cards'
}

{ #category : 'instance creation' }
RedoEffect class >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self new
		  initializeTargetedTo: aTargetShip
		  whoPlayed: aTargetCardName
]

{ #category : 'instance creation' }
RedoEffect class >> targetedTo: aTargetPlayer [

	^ self new initializeTargetedTo: aTargetPlayer whoPlayed: ''
]

{ #category : 'actions' }
RedoEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame applyRedoTo: aTargetShip from: owner whoPlayed: targetCardName
]

{ #category : 'checking' }
RedoEffect >> checkTargetShip: aTargetShip [

	aTargetShip isAValidTargetShip ifFalse: [ 
		Error signal: 'Redo Card target ship is invalid.' ]
]

{ #category : 'checking' }
RedoEffect >> checkTargetSquare: aSquareIndex [

	aSquareIndex > 0 ifFalse: [ 
		Error signal: 'Redo Card target square must be valid.' ]
]

{ #category : 'testing' }
RedoEffect >> hasTarget: aShip [

	^ target = aShip
]

{ #category : 'initialization' }
RedoEffect >> initializeTargetedTo: aTargetShip whoPlayed: aTargetCardName [

	target := aTargetShip.
	targetCardName := aTargetCardName
]

{ #category : 'testing' }
RedoEffect >> isCalled: aName [

	^ 'Redo Card' = aName
]

{ #category : 'actions' }
RedoEffect >> targetTo: aTargetShip [

	^ self class targetedTo: aTargetShip
]

{ #category : 'actions' }
RedoEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class targetTo: aTargetShip whoPlayed: aTargetCardName
]

{ #category : 'actions' }
RedoEffect >> targetedTo: aSquareIndex [

	self checkTargetSquare: aSquareIndex.
	^ self class targetedTo: aSquareIndex
]
