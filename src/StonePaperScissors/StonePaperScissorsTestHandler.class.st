Class {
	#name : 'StonePaperScissorsTestHandler',
	#superclass : 'TestCase',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'tests' }
StonePaperScissorsTestHandler >> testPaperAgainstPaperIsDraw [

	| result leftElement rightElement|

	leftElement := Paper new.
	rightElement := Paper new.

	result := leftElement play: rightElement result: ResultHandler new.

	self assert: result isDraw
	
]

{ #category : 'tests' }
StonePaperScissorsTestHandler >> testPaperAgainstScissorsIsWinning [

	| result leftElement rightElement|

	leftElement := Paper new.
	rightElement := Scissors new.

	result := leftElement play: rightElement result: ResultHandler new.

	self assert: result isDraw equals: false.
	self assert: result winner equals: rightElement.

	
	
]

{ #category : 'tests' }
StonePaperScissorsTestHandler >> testPaperAgainstStoneIsWinning [

	| result leftElement rightElement|

	leftElement := Paper new.
	rightElement := Stone new.

	result := leftElement play: rightElement result: ResultHandler new.

	self assert: result isDraw equals: false.
	self assert: result winner equals: leftElement.
]

{ #category : 'tests' }
StonePaperScissorsTestHandler >> testScissorsAgainstPaperIsWinning [

	| result leftElement rightElement|

	leftElement := Scissors new.
	rightElement := Paper new.

	result := leftElement play: rightElement result: ResultHandler new.

	self assert: result isDraw equals: false.
	self assert: result winner equals: leftElement.
]

{ #category : 'tests' }
StonePaperScissorsTestHandler >> testScissorsAgainstScissorsIsDraw [

	| result leftElement rightElement|

	leftElement := Scissors new.
	rightElement := Scissors new.

	result := leftElement play: rightElement result: ResultHandler new.

	self assert: result isDraw
]

{ #category : 'tests' }
StonePaperScissorsTestHandler >> testScissorsAgainstStoneIsWinning [

	| result leftElement rightElement|

	leftElement := Scissors new.
	rightElement := Stone new.

	result := leftElement play: rightElement result: ResultHandler new.

	self assert: result isDraw equals: false.
	self assert: result winner equals: rightElement
]

{ #category : 'tests' }
StonePaperScissorsTestHandler >> testStoneAgainstPaperIsWinning [ 

	| result leftElement rightElement|

	leftElement := Stone new.
	rightElement := Paper new.

	result := leftElement play: rightElement result: ResultHandler new.

	self assert: result isDraw equals: false.
	self assert: result winner equals: rightElement.
]

{ #category : 'tests' }
StonePaperScissorsTestHandler >> testStoneAgainstScissorsIsWinning [

	| result leftElement rightElement|

	leftElement := Stone new.
	rightElement := Scissors new.

	result := leftElement play: rightElement result: ResultHandler new.

	self assert: result isDraw equals: false.
	self assert: result winner equals: leftElement.
]

{ #category : 'tests' }
StonePaperScissorsTestHandler >> testStoneAgainstStoneIsDraw [ 

	| result leftElement rightElement|

	leftElement := Stone new.
	rightElement := Stone new.

	result := leftElement play: rightElement result: ResultHandler new.

	self assert: result isDraw
]
