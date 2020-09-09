Class {
	#name : #AkaiMPCProgramReader,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'Akai-MPC'
}

{ #category : #'instance creation' }
AkaiMPCProgramReader class >> on: aStream [
	^ self basicNew initializeOn: aStream
]

{ #category : #initialization }
AkaiMPCProgramReader >> initializeOn: aStream [
	self initialize.
	stream := aStream
]

{ #category : #initialization }
AkaiMPCProgramReader >> next [
	| inst sampleCount isFirstSampleLeftPadded |

	inst := AkaiMPCProgram new.
	self readPrefix.
	sampleCount := self readNumberOfSamples.
	isFirstSampleLeftPadded := false.
	(stream peek = 0) ifTrue: [ self term. isFirstSampleLeftPadded := true ].
	1 to: sampleCount do: [ :i | 
		inst samples add: (stream next: (i = 1
					  ifTrue: [ isFirstSampleLeftPadded ifTrue: [ 15 ] ifFalse: [ 16 ] ]
					  ifFalse: [ 16 ])) asString trimRight.
		stream next ].
	stream next: 2.
	inst name: (stream next: 16) asString trimRight.
	stream next: 16.
	35 to: 98 do: [ :i | 
		inst notes add: (stream nextLittleEndianNumber: 1).
		stream next: 24 ].
	stream next: 388.
	1 to: 64 do: [ :i | 
	inst pads add: (stream nextLittleEndianNumber: 1) ].
	^ inst
]

{ #category : #'as yet unclassified' }
AkaiMPCProgramReader >> readNumberOfSamples [
	^ stream nextLittleEndianNumber: 2
]

{ #category : #'as yet unclassified' }
AkaiMPCProgramReader >> readPrefix [
	#( 7 4 ) do: [ :i | 
		(stream nextLittleEndianNumber: 1) = i ifFalse: [ 
			self error: 'Expected ' , i ] ]
]

{ #category : #initialization }
AkaiMPCProgramReader >> readSampleName [
	^ (stream upTo: 0) asString trimRight
]

{ #category : #initialization }
AkaiMPCProgramReader >> readString: size [
	^ (stream next: size) asString
]

{ #category : #'as yet unclassified' }
AkaiMPCProgramReader >> term [
	(stream nextLittleEndianNumber: 1) = 0 ifFalse: [ 
		self error: 'Expected 0 (term)' ]
]
