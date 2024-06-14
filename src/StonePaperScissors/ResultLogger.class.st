Class {
	#name : 'ResultLogger',
	#superclass : 'ResultHandler',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'gameplay' }
ResultLogger >> drawBetween: aLeftElement and: aRightElement [

	('Draw between ', aLeftElement asString, ' and ', aRightElement asString) crTrace
]

{ #category : 'gameplay' }
ResultLogger >> winner: aWinnerElement against: aLooserElement [

	(aWinnerElement asString , ' win against ' , aLooserElement asString) crTrace
]
