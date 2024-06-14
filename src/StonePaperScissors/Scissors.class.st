Class {
	#name : 'Scissors',
	#superclass : 'GameElement',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
Scissors >> play: aGameElement [

	^ aGameElement playAgainstScissors: self
]

{ #category : 'gameplay' }
Scissors >> playAgainstPaper: aPaper [

	^ #scissors
]

{ #category : 'gameplay' }
Scissors >> playAgainstScissors: aScissors [

	^ #draw
]

{ #category : 'gameplay' }
Scissors >> playAgainstStone: aPaper [

	^ #stone
]
