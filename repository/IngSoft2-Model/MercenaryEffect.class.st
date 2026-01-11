Class {
	#name : 'MercenaryEffect',
	#superclass : 'Object',
	#instVars : [
		'target'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
MercenaryEffect class >> targetedTo: aTargetShip [
^ self new initializeTargetedTo: aTargetShip
]

{ #category : 'actions' }
MercenaryEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
 aShip = cardOwner ifTrue: [ aListMercenaries add: target ]
]

{ #category : 'actions' }
MercenaryEffect >> applyThrowEffectFor: aShip [
	^ 0
	
]

{ #category : 'initialization' }
MercenaryEffect >> initializeTargetedTo: aTargetShip [

	target := aTargetShip
]

{ #category : 'accessing' }
MercenaryEffect >> name [
	^ 'Mercenary Card'
]

{ #category : 'as yet unclassified' }
MercenaryEffect >> targetTo: aShip [ 
	^ self class targetedTo: aShip 
]
