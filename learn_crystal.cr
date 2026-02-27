# import the LearnCrystal module
require "./src/01-basics"
require "./src/02-intermediate[literals..typesAndMethods]"

# tutorial section
LearnCrystal_Basics.hello_world
LearnCrystal_Basics.math_operations
LearnCrystal_Basics.string_methods
LearnCrystal_Basics.control_flow
LearnCrystal_Basics.methods
LearnCrystal_Basics.default_arguments("Mashugana")
LearnCrystal_Basics.positional_arg_overloading("Doodles")
LearnCrystal_Basics.positional_arg_overloading(123)
puts LearnCrystal_Basics.adds_2(10)

# literals
LearnCrystal_Literals_TypesAndMethods.literals(10)
# assignment
LearnCrystal_Literals_TypesAndMethods.assignment
# local variables
# control expressions
LearnCrystal_Literals_TypesAndMethods.control_expressions
# requiring files
LearnCrystal_Literals_TypesAndMethods.requiring_files
# types and methods
types_and_methods = Types_and_methods.new "John"
p! types_and_methods.name
x = while types_and_methods.age <= 5
  types_and_methods.become_older
  puts "Age: #{types_and_methods.age}"
end
p! types_and_methods.become_older(3)
p! types_and_methods.foo(3, "")
puts types_and_methods.bar(x: 1, y: 2)

# exception handling
# type grammar
# type reflection
# type autocasting
# macros

# annotations
# low level primitives
# compile time flags
# c bindings
