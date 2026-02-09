"
When used in a permanent card allows the ship to hire a mercenary ship as an ally
"
Class {
	#name : 'MercenaryEffect',
	#superclass : 'PermanentCardEffect',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model-Cards',
	#package : 'IngSoft2-Model',
	#tag : 'Cards'
}

{ #category : 'instance creation' }
MercenaryEffect class >> targetedTo: aTargetShip [

	^ self new initializeTargetedTo: aTargetShip
]

{ #category : 'actions' }
MercenaryEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [

	aShip = cardOwner ifTrue: [ aListMercenaries add: targetShip ]
]

{ #category : 'actions' }
MercenaryEffect >> applyPlayedEffectIn: aGame from: owner to: aTargetShip [

	aGame checkIf: owner canHireAsMercenary: aTargetShip
]

{ #category : 'checking' }
MercenaryEffect >> checkTargetShip: aTargetShip [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Mercenary Card requiers a target ship.' ]
]

{ #category : 'testing' }
MercenaryEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
MercenaryEffect >> initializeTargetedTo: aTargetShip [

	targetShip := aTargetShip
]

{ #category : 'testing' }
MercenaryEffect >> isCalled: aName [

	^ 'Mercenary Card' = aName
]

{ #category : 'actions' }
MercenaryEffect >> targetTo: aShip [

	^ self class targetedTo: aShip
]
