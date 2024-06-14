Class {
	#name : 'ResultHandler',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'looser',
		'draw'
	],
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
ResultHandler >> draw: aGameElement [

	draw := aGameElement
]

{ #category : 'testing' }
ResultHandler >> isDraw [

	^ draw isNotNil
]

{ #category : 'results' }
ResultHandler >> looser [
	
	self isDraw ifTrue: [ self error: 'The game is draw, there is no looser' ].

	^ looser
]

{ #category : 'results' }
ResultHandler >> winner [

	self isDraw ifTrue: [ self error: 'The game is draw, there is no winner' ].

	^ winner
]

{ #category : 'gameplay' }
ResultHandler >> winner: aWinnerElement against: aLooserElement [

	winner := aWinnerElement.
	looser := aLooserElement
]
