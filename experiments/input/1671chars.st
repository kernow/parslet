[ :some | |a b c|
  "A method to illustrate some syntax"
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  b := self size + super size + super class GlobalVariable.
  b := self size + super size + super class GlobalVariable.
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  b := self size + super size + super class GlobalVariable.
  b := self size + super size + super class GlobalVariable.
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  b := self size + super size + super class GlobalVariable.
  b := self size + super size + super class GlobalVariable.
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  b := self size + super size + super class GlobalVariable.
  b := self size + super size + super class GlobalVariable.
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  true & false not & (nil isNil) ifFalse: [self halt; yourself].
  b := self size + super size + super class GlobalVariable.
  b := self size + super size + super class GlobalVariable.
  b := self size + super size + super class GlobalVariable.
  b := self size + super size + super class GlobalVariable.
  (#($a #a 'a' 1 1.0) addAll: { some . 1.2e10 . 2r101 })
    do: [:each | Transcript
      show: (each class name);
      show: (each printString);
      show: ' '].
  ^ x < y
]
