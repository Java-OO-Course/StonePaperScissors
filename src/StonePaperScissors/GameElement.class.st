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
GameElement >> competeWith: aGameElement onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> play: aGameElement [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
GameElement >> play: aGameElement result: aResultHandler [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> playAgainstPaper: aPaper [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> playAgainstPaper: aPaper onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
GameElement >> playAgainstPaper: aPaper result: aResultHandler [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> playAgainstScissors: aScissors [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> playAgainstScissors: aScissors onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
GameElement >> playAgainstScissors: aScissors result: aResultHandler [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> playAgainstStone: aPaper [

	self subclassResponsibility
]

{ #category : 'gameplay' }
GameElement >> playAgainstStone: aStone onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
GameElement >> playAgainstStone: aStone result: aResultHandler [

	self subclassResponsibility
]
