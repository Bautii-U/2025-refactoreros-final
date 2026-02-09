"
When used in a permanent card, it increases the total die roll of a selected ship by 1 (affects the total result, not individual die values)
"
Class {
	#name : 'SpeedEffect',
	#superclass : 'PermanentCardEffect',
	#instVars : [
		'targetShip',
		'speedValue'
	],
	#category : 'IngSoft2-Model-Cards',
	#package : 'IngSoft2-Model',
	#tag : 'Cards'
}

{ #category : 'instance creation' }
SpeedEffect class >> ofValue: aSpeedValue targetedTo: aTarget [

	^ self new initializeWithSpeedValue: aSpeedValue and: aTarget
]

{ #category : 'actions' }
SpeedEffect >> applyThrowEffectFor: aShip [

	aShip = targetShip ifTrue: [ ^ 1 ].
	
	^ 0
]

{ #category : 'checking' }
SpeedEffect >> checkForTargetRequirementsFor: aTargetShip whoPlayed: aTargetCardName [
]

{ #category : 'checking' }
SpeedEffect >> checkTargetShip: aTargetShip [

	aTargetShip isAValidTargetShip ifFalse: [
		Error signal: 'Speed Card requiers a target ship.' ]
]

{ #category : 'testing' }
SpeedEffect >> hasTarget: aShip [

	^ targetShip = aShip
]

{ #category : 'initialization' }
SpeedEffect >> initializeWithSpeedValue: aSpeedValue and: aTargetShip [

	speedValue := aSpeedValue.
	targetShip := aTargetShip
]

{ #category : 'testing' }
SpeedEffect >> isCalled: aName [

	^ 'Speed Card' = aName
]

{ #category : 'actions' }
SpeedEffect >> targetTo: aTargetShip [

	^ self class ofValue: speedValue targetedTo: aTargetShip
]

{ #category : 'actions' }
SpeedEffect >> targetTo: aTargetShip whoPlayed: aTargetCardName [

	^ self class ofValue: speedValue targetedTo: aTargetShip
]
