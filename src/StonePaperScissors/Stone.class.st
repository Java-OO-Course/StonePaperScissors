Class {
	#name : 'Stone',
	#superclass : 'GameElement',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
Stone >> play: anObject [ 

	^ anObject playAgainstStone: self
]

{ #category : 'gameplay' }
Stone >> playAgainstPaper: aPaper [

	^ #paper
]

{ #category : 'gameplay' }
Stone >> playAgainstScissors: aScissors [

	^ #stone
]

{ #category : 'gameplay' }
Stone >> playAgainstStone: aPaper [

	^ #draw
]
