Class {
	#name : 'Paper',
	#superclass : 'GameElement',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
Paper >> play: anObject [

	 ^ anObject playAgainstPaper: self
]

{ #category : 'gameplay' }
Paper >> playAgainstPaper: aPaper [ 

	^ #draw
]

{ #category : 'gameplay' }
Paper >> playAgainstScissors: aScissors [

	^ #scissors
]

{ #category : 'gameplay' }
Paper >> playAgainstStone: aStone [

	^ #paper
]
