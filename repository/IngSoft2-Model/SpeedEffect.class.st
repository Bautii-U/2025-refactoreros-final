Class {
	#name : 'SpeedEffect',
	#superclass : 'Object',
	#instVars : [
		'target',
		'speedValue'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
SpeedEffect class >> ofValue: aSpeedValue targetedTo: aTarget [

	^ self new initializeWithSpeedValue: aSpeedValue and: aTarget
]

{ #category : 'actions' }
SpeedEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [
]

{ #category : 'actions' }
SpeedEffect >> applyThrowEffectFor: aShip [

	aShip = target ifTrue: [ ^ 1 ].
	^ 0
]

{ #category : 'initialization' }
SpeedEffect >> initializeWithSpeedValue: aSpeedValue and: aTarget [
	speedValue := aSpeedValue.
	target := aTarget
]

{ #category : 'accessing' }
SpeedEffect >> name [
	^ 'Speed Card'
]

{ #category : 'as yet unclassified' }
SpeedEffect >> targetTo: aTargetShip [

	^ self class ofValue: speedValue targetedTo: aTargetShip
]
