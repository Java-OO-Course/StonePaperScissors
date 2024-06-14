Class {
	#name : 'Scissors',
	#superclass : 'GameElement',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
Scissors >> competeWith: aGameElement onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aGameElement playAgainstScissors: self onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock. 
]

{ #category : 'gameplay' }
Scissors >> play: aGameElement [

	^ aGameElement playAgainstScissors: self
]

{ #category : 'as yet unclassified' }
Scissors >> play: aGameElement result: aResultHandler [ 
	
	^ aGameElement playAgainstScissors: self result: aResultHandler 
]

{ #category : 'gameplay' }
Scissors >> playAgainstPaper: aPaper [

	^ #scissors
]

{ #category : 'gameplay' }
Scissors >> playAgainstPaper: aPaper onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [ 
	
	^ aLoseBlock value: aPaper value: self
]

{ #category : 'as yet unclassified' }
Scissors >> playAgainstPaper: aPaper result: aResultHandler [ 

	^ aResultHandler winner: self against: aPaper 
]

{ #category : 'gameplay' }
Scissors >> playAgainstScissors: aScissors [

	^ #draw
]

{ #category : 'gameplay' }
Scissors >> playAgainstScissors: aScissors onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aDrawBlock value: aScissors value: self
]

{ #category : 'as yet unclassified' }
Scissors >> playAgainstScissors: aScissors result: aResultHandler [

	^ aResultHandler draw: aScissors 
]

{ #category : 'gameplay' }
Scissors >> playAgainstStone: aPaper [

	^ #stone
]

{ #category : 'gameplay' }
Scissors >> playAgainstStone: aStone onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aWinBlock value: aStone value: self
]

{ #category : 'as yet unclassified' }
Scissors >> playAgainstStone: aStone result: aResultHandler [ 

	^ aResultHandler winner: aStone against: self 
]
