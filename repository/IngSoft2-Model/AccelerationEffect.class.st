Class {
	#name : 'AccelerationEffect',
	#superclass : 'Object',
	#instVars : [
		'accelerationValue'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
AccelerationEffect class >> ofValue: anAccelerationValue [
	^ self new initializeWith: anAccelerationValue 
]

{ #category : 'actions' }
AccelerationEffect >> applyMercenaryEffectFor: aShip in: aListMercenaries from: cardOwner [

]

{ #category : 'actions' }
AccelerationEffect >> applyThrowEffectFor: aShip [
	^ 1
]

{ #category : 'initialization' }
AccelerationEffect >> initializeWith: anAccelerationValue [
	accelerationValue := anAccelerationValue.
]

{ #category : 'accessing' }
AccelerationEffect >> name [
 	^ 'Acceleration Card'
]

{ #category : 'as yet unclassified' }
AccelerationEffect >> targetTo: aTargetShip [

	^ self
]
