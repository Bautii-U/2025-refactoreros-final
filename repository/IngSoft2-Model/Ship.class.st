"
Represents a player of the Game. 
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'playerName',
		'position',
		'shields',
		'maxShields',
		'cardsInHand'
	],
	#category : 'IngSoft2-Model-Game',
	#package : 'IngSoft2-Model',
	#tag : 'Game'
}

{ #category : 'accessing' }
Ship class >> for: aPlayerName startingAt: aPostion shieldedWith: aNumberOfShields holding: cards [

	^ self new
		  initializeFor: aPlayerName
		  startingAt: aPostion
		  shieldedWith: aNumberOfShields
		  holding: cards
]

{ #category : 'accessing' }
Ship >> boardPosition [

	^ position square
]

{ #category : 'actions' }
Ship >> breakAShield [

	shields > 0 ifTrue: [ shields := shields - 1 ].
	
]

{ #category : 'accessing' }
Ship >> cardsInHand [

	^ cardsInHand
]

{ #category : 'actions' }
Ship >> discardRandomCard [

	cardsInHand ifNotEmpty: [ cardsInHand remove: cardsInHand atRandom ]
]

{ #category : 'actions' }
Ship >> drawCard: aCard [
		
	cardsInHand add: aCard
]

{ #category : 'actions' }
Ship >> goToFirstSquare [

	position := position goToStartOfLap
]

{ #category : 'comparing' }
Ship >> hasGreaterPosition: anotherShip [

	^  position isGreaterThan: (anotherShip position)
]

{ #category : 'testing' }
Ship >> hasNoShields [

	^ shields = 0
]

{ #category : 'testing' }
Ship >> hasReachedLap: lapsGoal [

	^ position lap = lapsGoal
]

{ #category : 'accessing' }
Ship >> hasShields [

	^ shields > 0
]

{ #category : 'accessing' }
Ship >> initializeFor: aPlayerName startingAt: aPostion shieldedWith: aNumberOfShields holding: cards [

	playerName := aPlayerName.
	position := aPostion.
	shields := aNumberOfShields.
	maxShields := aNumberOfShields.
	cardsInHand := cards

]

{ #category : 'testing' }
Ship >> isAValidTargetShip [

	^ true
]

{ #category : 'accessing' }
Ship >> isAtTheSameSquareAs: anotherShip [

	^ position hasEqualPosition: anotherShip position
]

{ #category : 'accessing' }
Ship >> lapCount [

	^ position lap
]

{ #category : 'comparing' }
Ship >> lookForCard: aCardName [

	(cardsInHand anySatisfy: [ :aCard | aCard hasSameTypeAs: aCardName ])
		ifFalse: [ Error signal: 'The ship does not have this card' ].

	^ cardsInHand detect: [ :aCard | aCard hasSameTypeAs: aCardName ]
]

{ #category : 'actions' }
Ship >> moveBackwardsBy: aPosition [

	position := position decreaseBy: aPosition
]

{ #category : 'actions' }
Ship >> moveForwardBy: aSquareDistance [

	position := position increaseBy: aSquareDistance
]

{ #category : 'accessing' }
Ship >> playerName [

	^ playerName
]

{ #category : 'accessing' }
Ship >> position [

	^ position
]

{ #category : 'actions' }
Ship >> rechargeShields [

	shields := maxShields
]

{ #category : 'actions' }
Ship >> restoreAShield [

	shields := shields + 1
]

{ #category : 'accessing' }
Ship >> shields [

	^ shields
]

{ #category : 'actions' }
Ship >> throw: aCardName whenTurnOf: currentShip [

    | card |
    card := self lookForCard: aCardName.
    card checkForTurnRequierementWhen: self playsACardDuringTheTurnOf: currentShip.
    cardsInHand remove: card.
    
    ^ card playedBy: self
]

{ #category : 'actions' }
Ship >> throw: aCardName whenTurnOf: currentShip to: aTargetShip [

    | card |
    card := self lookForCard: aCardName.
    card checkForTurnRequierementWhen: self playsACardDuringTheTurnOf: currentShip.
    card checkForTargetRequirementsFor: aTargetShip.
    cardsInHand remove: card.
    
    ^ card playedBy: self targetedTo: aTargetShip
]

{ #category : 'actions' }
Ship >> throw: aCardName whenTurnOf: aShip to: aTargetShip whoPlayed: aTargetCardName [

	| card |
	card := self lookForCard: aCardName.
	card checkForTurnRequierementWhen: self playsACardDuringTheTurnOf: aShip.
	card checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName.
	cardsInHand remove: card.

	^ card playedBy: self targetedTo: aTargetShip whoPlayed: aTargetCardName
]

{ #category : 'actions' }
Ship >> throw: aCardName whenTurnOf: currentShip toSquare: aSquareIndex [

	| card |
	card := self lookForCard: aCardName.
	card checkForTurnRequierementWhen: self playsACardDuringTheTurnOf: currentShip.
	card checkForTargetRequirementsForSquare: aSquareIndex.
	cardsInHand remove: card.

	^ card playedBy: self targetedToSquare: aSquareIndex
]
