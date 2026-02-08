"
Cards are special game elements that ships can acquire and use to trigger effects, either instantly or over time, according to their type and the rules of the game.
"
Class {
	#name : 'Card',
	#superclass : 'Object',
	#instVars : [
		'owner',
		'effect'
	],
	#category : 'IngSoft2-Model-Card',
	#package : 'IngSoft2-Model',
	#tag : 'Card'
}

{ #category : 'instance creation' }
Card class >> acceleration [

	^ self new
		  initializeOwnedBy: nil
		  causing: (AccelerationEffect ofValue: 1)
]

{ #category : 'instance creation' }
Card class >> cancellation [

	^ self new
		  initializeOwnedBy: nil
		  causing: (CancellationEffect targetTo: nil whoPlayed: '')
]

{ #category : 'instance creation' }
Card class >> mercenary [

	^ self new
		  initializeOwnedBy: nil
		  causing: (MercenaryEffect targetedTo: nil)
]

{ #category : 'instance creation' }
Card class >> ownedBy: aShip causing: anEffect [

	^ self new initializeOwnedBy: aShip causing: anEffect
]

{ #category : 'instance creation' }
Card class >> protector [

	^ self new
		  initializeOwnedBy: nil
		  causing: (ProtectorEffect targetedTo: nil)
]

{ #category : 'instance creation' }
Card class >> redo [

	^ self new
		  initializeOwnedBy: nil
		  causing: (RedoEffect targetedTo: NullShip new)
]

{ #category : 'instance creation' }
Card class >> repeat [

	^ self new
		  initializeOwnedBy: nil
		  causing: (RepeatEffect targetedTo: NullShip new)
]

{ #category : 'instance creation' }
Card class >> reversal [

	^ self new
		  initializeOwnedBy: nil
		  causing: (ReversalEffect targetedTo: 0)
]

{ #category : 'instance creation' }
Card class >> speed [

	^ self new
		  initializeOwnedBy: nil
		  causing: (SpeedEffect ofValue: 1 targetedTo: NullShip new)
]

{ #category : 'actions' }
Card >> applyMercenaryEffectFor: aShip in: shipWithMercenaries [

	^ effect
		  applyMercenaryEffectFor: aShip
		  in: shipWithMercenaries
		  from: owner
]

{ #category : 'actions' }
Card >> applyOnPlayed: aGame [

	effect applyPlayedEffectIn: aGame from: owner to: NullShip new
]

{ #category : 'actions' }
Card >> applyOnPlayed: aGame to: aTargetShip [

	effect applyPlayedEffectIn: aGame from: owner to: aTargetShip
]

{ #category : 'actions' }
Card >> applyThrowEffectFor: aShip [

	^ effect applyThrowEffectFor: aShip
]

{ #category : 'actions' }
Card >> breakAShield [

	^ effect takeDamage
]

{ #category : 'testing' }
Card >> canProtect: aShip [

	^ effect canProtect: aShip ownedBy: owner
]

{ #category : 'checking' }
Card >> checkForTargetRequirementsFor: aTargetShip [

	effect checkTargetShip: aTargetShip.
]

{ #category : 'checking' }
Card >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [

	effect
		checkForTargetRequirementsFor: aTargetShip
		whoPlayed: aTargetCardName
]

{ #category : 'checking' }
Card >> checkForTargetRequirementsForSquare: aSquareIndex [

	effect checkTargetSquare: aSquareIndex
]

{ #category : 'checking' }
Card >> checkForTurnRequierementWhen: aShip playsACardDuringTheTurnOf: anotherShip [

	^ effect
		  checkForTurnRequierementWhen: aShip
		  playsACardDuringTheTurnOf: anotherShip
]

{ #category : 'testing' }
Card >> hasSameTypeAs: aCardName [

	^ effect isCalled: aCardName
]

{ #category : 'testing' }
Card >> hasTarget: aShip [

	^ effect hasTarget: aShip
]

{ #category : 'initialization' }
Card >> initializeOwnedBy: aShip causing: anEffect [

	owner := aShip.
	effect := anEffect.
	
]

{ #category : 'testing' }
Card >> is: aCardName ownedBy: aShip [

	^ aShip = owner and: (effect isCalled: aCardName)
]

{ #category : 'accessing' }
Card >> isReversalActiveAt: aSquareIndex [

	^ effect isReversalFor: aSquareIndex
]

{ #category : 'actions' }
Card >> playedBy: aShip [

	^ self class ownedBy: aShip causing: effect
]

{ #category : 'actions' }
Card >> playedBy: aShip targetedTo: aTargetShip [

    ^ self class ownedBy: aShip causing: (effect targetTo: aTargetShip).
]

{ #category : 'actions' }
Card >> playedBy: aShip targetedTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class ownedBy: aShip causing: (effect targetTo: aTargetShip whoPlayed: aTargetCardName)
]

{ #category : 'actions' }
Card >> playedBy: aShip targetedToSquare: aSquareIndex [

    ^ self class ownedBy: aShip causing: (effect targetedTo: aSquareIndex).
]
