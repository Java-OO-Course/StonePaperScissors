Class {
	#name : 'BaselineOfStonePaperScissors',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfStonePaperScissors',
	#package : 'BaselineOfStonePaperScissors'
}

{ #category : 'baselines' }
BaselineOfStonePaperScissors >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		spec package: 'StonePaperScissors'
	]
]
