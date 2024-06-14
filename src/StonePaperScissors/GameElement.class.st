Class {
	#name : 'GameElement',
	#superclass : 'Object',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'testing' }
GameElement class >> isAbstract [

	^ self == GameElement
]

{ #category : 'gameplay' }
GameElement >> play: aGameElement [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> playAgainstPaper: aPaper [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> playAgainstScissors: aScissors [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> playAgainstStone: aPaper [

	self subclassResponsibility
]
