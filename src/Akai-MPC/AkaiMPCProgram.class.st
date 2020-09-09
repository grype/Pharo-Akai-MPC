Class {
	#name : #AkaiMPCProgram,
	#superclass : #Object,
	#instVars : [
		'samples',
		'name',
		'notes',
		'pads'
	],
	#category : #'Akai-MPC'
}

{ #category : #initialization }
AkaiMPCProgram >> initialize [
	super initialize.
	notes := OrderedCollection new.
	samples := OrderedCollection new.
	pads := OrderedCollection new
]

{ #category : #accessing }
AkaiMPCProgram >> name [
	^ name
]

{ #category : #accessing }
AkaiMPCProgram >> name: anObject [
	name := anObject
]

{ #category : #accessing }
AkaiMPCProgram >> notes [
	^ notes
]

{ #category : #accessing }
AkaiMPCProgram >> notes: anObject [
	notes := anObject
]

{ #category : #accessing }
AkaiMPCProgram >> pads [
	^ pads
]

{ #category : #accessing }
AkaiMPCProgram >> pads: anObject [
	pads := anObject
]

{ #category : #'as yet unclassified' }
AkaiMPCProgram >> sampleAtPad: anInt [
	^ samples at: (notes at: (pads at: anInt) - 35 + 1) + 1
]

{ #category : #accessing }
AkaiMPCProgram >> samples [
	^ samples
]

{ #category : #accessing }
AkaiMPCProgram >> samples: anObject [
	samples := anObject
]
