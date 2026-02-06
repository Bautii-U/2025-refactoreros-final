"
When used in a permanent card, it increases the total die roll of all ships by 1 (affects the total result, not individual die values)
"
Class {
	#name : 'AccelerationEffect',
	#superclass : 'PermanentCardEffect',
	#instVars : [
		'accelerationValue'
	],
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'instance creation' }
AccelerationEffect class >> ofValue: anAccelerationValue [

	^ self new initializeWith: anAccelerationValue
]

{ #category : 'actions' }
AccelerationEffect >> applyThrowEffectFor: aShip [

	^ accelerationValue
]

{ #category : 'initialization' }
AccelerationEffect >> initializeWith: anAccelerationValue [

	accelerationValue := anAccelerationValue
]

{ #category : 'accessing' }
AccelerationEffect >> isCalled: aName [

	^ 'Acceleration Card' = aName
]
