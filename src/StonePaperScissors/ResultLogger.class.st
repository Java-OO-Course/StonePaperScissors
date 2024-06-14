Class {
	#name : 'ResultLogger',
	#superclass : 'ResultHandler',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
ResultLogger >> drawBetween: aLeftElement and: aRightElement [

	super winner: aLeftElement against: aRightElement.

	('Draw between ', aLeftElement asString, ' and ', aRightElement asString) crTrace
]

{ #category : 'gameplay' }
ResultLogger >> winner: aWinnerElement against: aLoserElement [

	super winner: aWinnerElement against: aLoserElement.
	 
	(aWinnerElement asString , ' win against ' , aLoserElement asString) crTrace
]
