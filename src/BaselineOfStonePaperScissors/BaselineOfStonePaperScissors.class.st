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
		spec postLoadDoIt: #postload:package:.
		
		spec package: 'StonePaperScissors'
	].

]

{ #category : 'actions' }
BaselineOfStonePaperScissors >> postload: aLoader package: aSpecPackage [

	'StonePaperScissors' asPackage browse
]
