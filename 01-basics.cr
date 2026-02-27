# functions are made through
def funcName(a, b)
  a + b
end

puts(funcName(1, 2))

# local variables in the top level scope are file local and not visible inside method bodies
# x = 1

# def add(a)
#   a + x
# end

# puts(add(a)) //THIS DOES NOT WORK

# a double colon prefix :: unambiguously references a namespace, constant, method, or macro in the top level scope

def baz
  puts "::baz"
end

CONST = "::CONST"

module A
  def self.baz
    puts "A.baz"
  end

  # Without prefix, resolves to the method in the local scope
  baz

  # With :: prefix, resolves to the method in the top-level scope
  ::baz

  CONST = "A::Const"

  p! CONST   # => "A::CONST"
  p! ::CONST # => "::CONST"
end
