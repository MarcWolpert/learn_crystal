module LearnCrystal_Literals_TypesAndMethods
  VERSION = "0.1.0"
  enum Foo
    X = 1
    Y = 2
    Z = 3
  end

  # literal definition with *x* as the type parameter
  def self.literals(x : Int32 | String | Nil) : Nil
    # sets
    p! Set{1, 2, 3, 1}
    # if using splat expansion it must be enumerable
    p! Set{*Set{1, 2, 3, 1}}
    # hash, hash like
    # key-value pairs
    p!({"one" => 15, "two" => 25, "three" => 35}["two"])
    # explicit key-value type annotations on empty hash
    p! Hash(Int32, Int32).new # {} of Int32 => Int32
    #  name-tuple
    user = {name: "Marc", age: 7e10}
    puts user
    puts user[:name]
    # proc short for function pointer with optional context (closure data)
    func = ->(x : Int32) { x + 2 }
    puts func.call(10)
    # func(argTypes..., returnType)
    foo = Proc(Int32, String).new { |x| x.to_s }
    puts foo.call(10)
    foo = ->self.literals_pass(Int32)
    puts foo.call(10)

    # command
    # these are the same as % string literals with nesting rules
    # basically for readability
    p! `echo "Hello, #{x}!"`
    process = Process.new("echo", ["Hello, #{x}!"], output: Process::Redirect::Pipe)
    process.output.gets_to_end
    process.wait.success?
  end

  def self.literals_pass(x : Int32)
    String
    "Hello, #{x}!"
  end

  def self.assignment : Nil
    # types of local assignment
    # local variable
    # x=1
    # instance variable
    # @instance=2
    # class variable
    # @@class = 3
    # assigns to a constant
    # CONST = 4
    # Assigns to a setter method
    # foo.method=5
    # foo[0]=6

    # one to many assignments
    name, age, source = "Crystal, 123, Github".split(",")
    p! name, age, source
    # however if strict_multi_assign flag is provided, the # of elements must mach the number of targes and the rhs must be an Indexable
    head, *rest = [1, 2, 3, 4, 5]
    p! head, rest

    # negative indices are used for targets after the splat
    *rest, tail1, tail2 = [1, 2, 3, 4, 5]
    p! rest, tail1, tail2

    # underscore is a placeholder for a value that is not used
    _ = "This is a string"

    before, _, after = "main.cr".partition(".")
    p! before, after

    # assignments to splats can be ignored with *_
    *_, last = [1, 2, 3, 4, 5]
    p! last

    return nil
  end

  def self.control_expressions : Nil
    a = 1
    # if as a suffix
    a = 2 if a <= 1
    p! a
    # as an expression
    a = if 2 > 1
          3
        else
          4
        end
    p! a
    # ternary if
    a = a <= 1 ? 2 : 3
    p! a
    # if var
    if a == 3
      puts "a is 3"
    end

    # if var.is_a?(...)
    # you can check the type and the other else blocks will be that type if the if (type) != checkType
    # doesn't work with instance variables or class variables

    # if var.responds_to?(:method_name)
    # check if the variable has this method on it
    # doesn't work with instance variables or class variables, so need to assign to a local variable first

    # if var.nil?
    #

    # if !
    # returns a bool based on truthiness

    # swtich case statements
    a = 5
    case a
    when 5, 6 then puts "a is 5 or 6"
    when 7    then puts "a is 7"
    else           puts "a is something else"
    end
    # can also be expanded to multiple lines but 1-liner is more idiomatic imo

    # can also do with tuple literals
    a, b = 1, 2
    case {a, b}
    when {0, 0} then puts "a is 0 and b is 0"
    when {0, 1} then puts "a is 0 and b is 1"
    else             puts "a is something else and b is something else"
    end
    # can also do with underscores
    # can also call a method on the case statement on the when clause
    case {a, b}
    when {.even?, .even?} then puts "a and b are both even"
    when {.odd?, .odd?}   then puts "a and b are both odd"
    else                       puts "1 of them is even and the other is odd"
    end
    # compare against type
    case {a, b}
    when {Int32, Int32} then puts "a and b are both integers"
    else                     puts "a and b are not both integers"
    end
    union_type_example : Int32 | String = 1
    case union_type_example
    in Int32  then puts "union_type_example is an integer"
    in String then puts "union_type_example is a string"
    end

    var : Foo = Foo::X
    case var
    in Foo::X then puts "var is Foo::X"
    in Foo::Y then puts "var is Foo::Y"
    in Foo::Z then puts "var is Foo::Z"
    end

    # select statement
    select
    when Foo::X == 1 then puts "1"
    when Foo::X == 2 then puts "2"
    when Foo::X == 3 then puts "3"
    else
      puts "something else"
    end

    return nil
  end
end
