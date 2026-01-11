Class {
	#name : 'PermanentCard',
	#superclass : 'Object',
	#instVars : [
		'owner',
		'effect'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
PermanentCard class >> accelerationWithoutOwner [

	^ self new
		  initializeOwnedBy: NullShip new
		  causing: (AccelerationEffect ofValue: 1)
]

{ #category : 'instance creation' }
PermanentCard class >> mercenaryWithoutOwner [

	^ self new
		  initializeOwnedBy: NullShip new
		  causing: (MercenaryEffect targetedTo: NullShip new)
]

{ #category : 'instance creation' }
PermanentCard class >> ownedBy: aShip causing: aThrowEffect [

	^ self new initializeOwnedBy: aShip causing: aThrowEffect
]

{ #category : 'instance creation' }
PermanentCard class >> speedWithoutOwner [

	^ self new
		  initializeOwnedBy: NullShip new
		  causing: (SpeedEffect ofValue: 1 targetedTo: NullShip new)
]

{ #category : 'actions' }
PermanentCard >> activateFor: anOwnerShip targetedTo: aTargetShip [

	^ self class
		  ownedBy: anOwnerShip
		  causing: (effect targetTo: aTargetShip)
]

{ #category : 'actions' }
PermanentCard >> applyMercenaryEffectFor: aShip in: shipWithMercenaries [
	^ (effect applyMercenaryEffectFor: aShip in: shipWithMercenaries from: owner)
]

{ #category : 'actions' }
PermanentCard >> applyThrowEffectFor: aShip [

	^ (effect applyThrowEffectFor: aShip)
]

{ #category : 'accessing' }
PermanentCard >> getThrowEffect [
	^ effect 
]

{ #category : 'testing' }
PermanentCard >> hasSameTypeAs: aCardName [
	^ (effect name = aCardName )
]

{ #category : 'initialization' }
PermanentCard >> initializeOwnedBy: aShip causing: anEffect [

	owner := aShip.
	effect := anEffect.
	
]
