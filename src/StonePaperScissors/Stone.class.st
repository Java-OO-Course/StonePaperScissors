Class {
	#name : 'Stone',
	#superclass : 'GameElement',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
Stone >> competeWith: aGameElement onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aGameElement playAgainstStone: self onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock 
]

{ #category : 'gameplay' }
Stone >> play: anObject [ 

	^ anObject playAgainstStone: self
]

{ #category : 'gameplay' }
Stone >> playAgainstPaper: aPaper [

	^ #paper
]

{ #category : 'gameplay' }
Stone >> playAgainstPaper: aPaper onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aWinBlock value: aPaper value: self
]

{ #category : 'gameplay' }
Stone >> playAgainstScissors: aScissors [

	^ #stone
]

{ #category : 'gameplay' }
Stone >> playAgainstScissors: aScissors onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aLoseBlock value: aScissors value: self
]

{ #category : 'gameplay' }
Stone >> playAgainstStone: aPaper [

	^ #draw
]

{ #category : 'gameplay' }
Stone >> playAgainstStone: aStone onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aDrawBlock value: aStone value: self
]
