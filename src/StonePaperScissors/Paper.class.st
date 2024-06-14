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

{ #category : 'as yet unclassified' }
Paper >> play: aGameElement result: aResultHandler [ 
	
	^ aGameElement playAgainstPaper: self result: aResultHandler 
]

{ #category : 'gameplay' }
Paper >> playAgainstPaper: aPaper [ 

	^ #draw
]

{ #category : 'gameplay' }
Paper >> playAgainstPaper: aPaper onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [ 
	
	^ aDrawBlock value: aPaper value: self
]

{ #category : 'as yet unclassified' }
Paper >> playAgainstPaper: aPaper result: aResultHandler [ 
	
	^ aResultHandler draw: aPaper
]

{ #category : 'gameplay' }
Paper >> playAgainstScissors: aScissors [

	^ #scissors
]

{ #category : 'gameplay' }
Paper >> playAgainstScissors: aScissors onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aWinBlock value: aScissors value: self
]

{ #category : 'as yet unclassified' }
Paper >> playAgainstScissors: aScissors result: aResultHandler [ 
	
	^ aResultHandler winner: aScissors against: self
]

{ #category : 'gameplay' }
Paper >> playAgainstStone: aStone [

	^ #paper
]

{ #category : 'gameplay' }
Paper >> playAgainstStone: aStone onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock [

	^ aLoseBlock value: aStone value: self
]

{ #category : 'as yet unclassified' }
Paper >> playAgainstStone: aStone result: aResultHandler [ 

	^ aResultHandler winner: self against: aStone 
]
