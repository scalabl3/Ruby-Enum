# Enum Parent Class for emulating Enum's of other strong typed languages like C++, C# and Java
# Usage: 
# => class MyEnum < Enum
# => 		enum_attr :val1, 1
# => 		enum_attr :val2, 2
# => end
#
# e = MyEnum.new MyEnum::VAL2 # => #<MyEnum:0x007f968b2bef20 @attrs=2>
# e.val2?	# => true
# e.val1?	# => false
# e.to_i	# => 2
# e.val1 = true # => true
# e.val1?	# => true
#
# m = MyClass.new {myvar => "my var value", myenum => MyEnum::VAL1 }
#
class Enum

  private

  def self.enum_attr(name, num)
    name = name.to_s

		# create class constant
    const_set(name.upcase, num)

    # create attribute get method
    define_method(name) do
      @attrs
    end

    # create attribute? method
    define_method(name + '?') do
      @attrs & num != 0
    end
    
		# create attribute = set method
    define_method(name + '=') do |set|
      if set
        @attrs |= num
      else
        @attrs &= ~num
      end
    end

  end

  public

  def initialize(attrs = 0)
    if attrs.is_a? Fixnum
      @attrs = attrs
    end

    if attrs.is_a? Symbol
      send attrs.to_s + "=", class_eval(self.class.to_s + "::" + attrs.to_s.upcase)
    end

    if attrs.is_a? Array
      attrs.each do |attr|
        send attr.to_s + "=", class_eval(self.class.to_s + "::" + attr.to_s.upcase)
      end
    end
  end

  def to_i
    @attrs
  end
end