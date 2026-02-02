"
When used in a permanent card allows the ship to hire a mercenary ship as an ally
"
Class {
	#name : 'MercenaryEffect',
	#superclass : 'Object',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
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

{ #category : 'actions' }
MercenaryEffect >> applyThrowEffectFor: aShip [
	^ 0
	
]

{ #category : 'checking' }
MercenaryEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [
]

{ #category : 'checking' }
MercenaryEffect >> checkForTurnRequierementWhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
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

{ #category : 'accessing' }
MercenaryEffect >> isCalled: aName [

	^ 'Mercenary Card' = aName
]

{ #category : 'actions' }
MercenaryEffect >> targetTo: aShip [

	^ self class targetedTo: aShip
]

{ #category : 'actions' }
MercenaryEffect >> targetTo: aShip whoPlayed: aTargetCardName [

	^ self class targetedTo: aShip
]
