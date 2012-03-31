require './object_method_print.rb'
require './enum.rb'

class MyEnum < Enum
  enum_attr :val1, 1
  enum_attr :val2, 2
end

puts "Create Enum using Class Constant parameter"
e = MyEnum.new MyEnum::VAL2 # => #<MyEnum:0x007f968b2bef20 @attrs=2>
puts e.val2?	# => true
puts e.val1?	# => false
puts e.to_i	# => 2
puts e.to_s	# => MyEnum::VAL2
puts ""
puts "Add Val1 to the Enum"
e.val1 = true # => true
puts e.val1?	# => true
puts e.to_i	# => 3
puts e.to_s # => nil
puts e.to_s.class # => nil
