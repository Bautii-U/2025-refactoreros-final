Class {
	#name : 'DiceCup',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'IngSoft2-Model-Game',
	#package : 'IngSoft2-Model',
	#tag : 'Game'
}

{ #category : 'instance creation' }
DiceCup class >> withAll: aDiceCollection [

	aDiceCollection isNotEmpty ifFalse: [
		Error signal: 'At least one die is required' ].

	^ self new initializeWith: aDiceCollection
]

{ #category : 'initialization' }
DiceCup >> initializeWith: aDiceCollection [

	dice := aDiceCollection
]

{ #category : 'action' }
DiceCup >> roll [

	^ (dice collect: [ :die | die roll ]) sum
]
