Class {
	#name : #BaselineOfAkaiMPC,
	#superclass : #BaselineOf,
	#category : #BaselineOfAkaiMPC
}

{ #category : #baselines }
BaselineOfAkaiMPC >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec package: 'Akai-MPC'.
		spec group: 'default' with: #( 'Akai-MPC' ) ]
]
