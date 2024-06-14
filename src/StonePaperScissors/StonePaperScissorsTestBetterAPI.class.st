Class {
	#name : 'StonePaperScissorsTestBetterAPI',
	#superclass : 'TestCase',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'tests' }
StonePaperScissorsTestBetterAPI >> testPaperAgainstPaperIsDraw [

	| result leftElement rightElement|

	leftElement := Paper new.
	rightElement := Paper new.

	result := leftElement competeWith: rightElement
		onDraw: [ :left :right | { #draw . left . right } ]
		onReceiverWin: [ :left :right | { #win . left . right } ]
		onReceiverLose: [ :left :right | { #defeat . left . right } ].

	self assert: result first equals: #draw.
	self assert: result second equals: leftElement.
	self assert: result third equals: rightElement.
]

{ #category : 'tests' }
StonePaperScissorsTestBetterAPI >> testPaperAgainstScissorsIsWinning [

	| result leftElement rightElement|

	leftElement := Paper new.
	rightElement := Scissors new.

	result := leftElement competeWith: rightElement
		onDraw: [ :left :right | { #draw . left . right } ]
		onReceiverWin: [ :left :right | { #win . left . right } ]
		onReceiverLose: [ :left :right | { #defeat . left . right } ].

	self assert: result first equals: #defeat.
	self assert: result second equals: leftElement.
	self assert: result third equals: rightElement.
]

{ #category : 'tests' }
StonePaperScissorsTestBetterAPI >> testPaperAgainstStoneIsWinning [

	| result leftElement rightElement|

	leftElement := Paper new.
	rightElement := Stone new.

	result := leftElement competeWith: rightElement
		onDraw: [ :left :right | { #draw . left . right } ]
		onReceiverWin: [ :left :right | { #win . left . right } ]
		onReceiverLose: [ :left :right | { #defeat . left . right } ].

	self assert: result first equals: #win.
	self assert: result second equals: leftElement.
	self assert: result third equals: rightElement.
]

{ #category : 'tests' }
StonePaperScissorsTestBetterAPI >> testScissorsAgainstPaperIsWinning [

	| result leftElement rightElement|

	leftElement := Scissors new.
	rightElement := Paper new.

	result := leftElement competeWith: rightElement
		onDraw: [ :left :right | { #draw . left . right } ]
		onReceiverWin: [ :left :right | { #win . left . right } ]
		onReceiverLose: [ :left :right | { #defeat . left . right } ].

	self assert: result first equals: #win.
	self assert: result second equals: leftElement.
	self assert: result third equals: rightElement.
]

{ #category : 'tests' }
StonePaperScissorsTestBetterAPI >> testScissorsAgainstScissorsIsDraw [

	| result leftElement rightElement|

	leftElement := Scissors new.
	rightElement := Scissors new.

	result := leftElement competeWith: rightElement
		onDraw: [ :left :right | { #draw . left . right } ]
		onReceiverWin: [ :left :right | { #win . left . right } ]
		onReceiverLose: [ :left :right | { #defeat . left . right } ].

	self assert: result first equals: #draw.
	self assert: result second equals: leftElement.
	self assert: result third equals: rightElement.
]

{ #category : 'tests' }
StonePaperScissorsTestBetterAPI >> testScissorsAgainstStoneIsWinning [

	| result leftElement rightElement|

	leftElement := Scissors new.
	rightElement := Stone new.

	result := leftElement competeWith: rightElement
		onDraw: [ :left :right | { #draw . left . right } ]
		onReceiverWin: [ :left :right | { #win . left . right } ]
		onReceiverLose: [ :left :right | { #defeat . left . right } ].

	self assert: result first equals: #defeat.
	self assert: result second equals: leftElement.
	self assert: result third equals: rightElement.
]

{ #category : 'tests' }
StonePaperScissorsTestBetterAPI >> testStoneAgainstPaperIsWinning [ 

	| result leftElement rightElement|

	leftElement := Stone new.
	rightElement := Paper new.

	result := leftElement competeWith: rightElement
		onDraw: [ :left :right | { #draw . left . right } ]
		onReceiverWin: [ :left :right | { #win . left . right } ]
		onReceiverLose: [ :left :right | { #defeat . left . right } ].

	self assert: result first equals: #defeat.
	self assert: result second equals: leftElement.
	self assert: result third equals: rightElement.
]

{ #category : 'tests' }
StonePaperScissorsTestBetterAPI >> testStoneAgainstScissorsIsWinning [

	| result leftElement rightElement|

	leftElement := Stone new.
	rightElement := Scissors new.

	result := leftElement competeWith: rightElement
		onDraw: [ :left :right | { #draw . left . right } ]
		onReceiverWin: [ :left :right | { #win . left . right } ]
		onReceiverLose: [ :left :right | { #defeat . left . right } ].

	self assert: result first equals: #win.
	self assert: result second equals: leftElement.
	self assert: result third equals: rightElement.
]

{ #category : 'tests' }
StonePaperScissorsTestBetterAPI >> testStoneAgainstStoneIsDraw [ 

	| result leftElement rightElement|

	leftElement := Stone new.
	rightElement := Stone new.

	result := leftElement competeWith: rightElement
		onDraw: [ :left :right | { #draw . left . right } ]
		onReceiverWin: [ :left :right | { #win . left . right } ]
		onReceiverLose: [ :left :right | { #defeat . left . right } ].

	self assert: result first equals: #draw.
	self assert: result second equals: leftElement.
	self assert: result third equals: rightElement.
]
