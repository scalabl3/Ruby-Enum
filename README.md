## Enum Parent Class for emulating Enum's of other strong typed languages like C++, C# and Java

### Usage:
``` ruby
class MyEnum < Enum
	enum_attr :val1, 1
	enum_attr :val2, 2
end

e = MyEnum.new MyEnum::VAL2 # => #<MyEnum:0x007f968b2bef20 @attrs=2>
e.val2?					# => true
e.val1?					# => false
e.to_i					# => 2
e.to_s					# => MyEnum::VAL2		
# Note: returns nil if not 1:1, so if you are using bit-based combinations, 
# currently won't find it or calc it, see example below...

e.val1 = true		# => true
e.val1?					# => true
e.to_i					# => 3
e.to_s					# => nil because it is a composite set of multiple enums bit |=
e.to_s.class		# => NilClass

puts e.pm

#  to_i()       MyEnum(Enum)
#  val1()       MyEnum
# val1=(arg1)   MyEnum
# val1?()       MyEnum
#  val2()       MyEnum
# val2=(arg1)   MyEnum
# val2?()       MyEnum

constants = instance_eval e.class.to_s + "::constants"
puts constants.inspect	# => [:VAL1, :VAL2]

```
### Example Usage:
``` ruby
m = MyClass.new {myvar => "my var value", myenum => MyEnum::VAL1 }
```

### TODO
**Initialize:**

1. Check fixnum/integer parameter in initialize against created class Constants to see if valid, raise error if not

2. Check symbol parameter in initialize against created class Constants to see if valid, raise error if not

**New Subclasses**

1. Create an Exclusive Enum (XOR)

2. Create Bitwise Enum (&=) "aware" to_s method that calculates the Constants required to create that int value
