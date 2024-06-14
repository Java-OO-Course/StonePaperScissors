Class {
	#name : 'Paper',
	#superclass : 'GameElement',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
Paper >> competeWith: aGameElement onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aGameElement playAgainstPaper: self onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock

]

{ #category : 'gameplay' }
Paper >> play: anObject [

	 ^ anObject playAgainstPaper: self
]

{ #category : 'gameplay' }
Paper >> playAgainstPaper: aPaper [ 

	^ #draw
]

{ #category : 'gameplay' }
Paper >> playAgainstPaper: aPaper onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [ 
	
	^ aDrawBlock value: aPaper value: self
]

{ #category : 'gameplay' }
Paper >> playAgainstScissors: aScissors [

	^ #scissors
]

{ #category : 'gameplay' }
Paper >> playAgainstScissors: aScissors onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aWinBlock value: aScissors value: self
]

{ #category : 'gameplay' }
Paper >> playAgainstStone: aStone [

	^ #paper
]

{ #category : 'gameplay' }
Paper >> playAgainstStone: aStone onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aLoseBlock value: aStone value: self
]
