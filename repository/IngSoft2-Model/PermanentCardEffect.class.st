Class {
	#name : 'PermanentCardEffect',
	#superclass : 'CardEffect',
	#category : 'IngSoft2-Model-CardEffect',
	#package : 'IngSoft2-Model',
	#tag : 'CardEffect'
}

{ #category : 'checking' }
PermanentCardEffect >> checkForTurnRequierementWhen: aShip playsACardDuringTheTurnOf: anotherShip [

	aShip ~= anotherShip ifTrue: [
		Error signal:
			'The ship is trying to use a permanent card out of its turn' ]
]
