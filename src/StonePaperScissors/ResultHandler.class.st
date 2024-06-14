Class {
	#name : 'ResultHandler',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'draw',
		'loser'
	],
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
ResultHandler >> drawBetween: aLeftElement and: aRightElement [

	draw := true
]

{ #category : 'testing' }
ResultHandler >> isDraw [

	draw ifNil: [ self error: 'Result not defined' ].

	^ draw
]

{ #category : 'results' }
ResultHandler >> loser [
	
	self isDraw ifTrue: [ self error: 'The game is draw, there is no loser' ].
	loser ifNil: [ self error: 'Result not defined' ].

	^ loser
]

{ #category : 'results' }
ResultHandler >> winner [

	self isDraw ifTrue: [ self error: 'The game is draw, there is no winner' ].
	winner ifNil: [ self error: 'Result not defined' ].

	^ winner
]

{ #category : 'gameplay' }
ResultHandler >> winner: aWinnerElement against: aLoserElement [

	winner := aWinnerElement.
	loser := aLoserElement.
	draw := false.
]
