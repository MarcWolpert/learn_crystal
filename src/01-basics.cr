# TODO: Write documentation for `LearnCrystal`
module LearnCrystal_Basics
  VERSION = "0.1.0"

  # Prints "Hello, <name>!" to the console. Prints "Hello, <name>!" to the console. Prints "Hello, <name>!" to the console. Prints "Hello, <name>!" to the console. Prints "Hello, <name>!" to the console. Prints "Hello, <name>!" to the console. Prints "Hello, <name>!" to the console.
  def self.hello_world : Nil
    # define a variable
    name = "Marc"
    # prints to stdout
    puts "Hello, #{name}!"
    # you can also use p! to print to stdout but it also prints the expression in code
    # useful for debugging
    p! typeof(name)
    puts "#{typeof(name)}"
    # reassigning a variable
    name = 10
    p! typeof(name)
    return nil
  end

  def self.named_tuples_example(x, **other) : Nil
    p! x, other
    return nil
  end

  def self.math_operations : Nil
    # how to write an integer literal
    x = 10
    # not this way as it's not an integer literal
    # x=01 --> this is an octal literal
    # fp literal
    y = 1.0    # needs 2 or more base digits with a .
    z = 1.0e10 # scientific notation
    p! typeof(x)
    p! typeof(y)
    p! typeof(z)

    # same numerical value are considered equal regarding the equality operator independent of their type, so judge based on base value not type
    p! 1 == 1, 1.0 == 1, 1.0 == 2

    # comparison operators
    p! x > y, x < y, x >= y, x <= y, x == y, x != y
    # spaceship operator
    # this operator returns 0 if val=equal
    # this operator returns 1 if val>other
    # this operator returns -1 if val<other
    p! x <=> y

    # addition, sub, mult, exp, division, floor div, modulus, negation
    p! x + y, x - y, x * y, x ** y, x / y, x // y, x % 3, -x
    # wrapping operators will overflow or underflow to the nearest representable value
    p! 2 &** 64 + 5
    # inversion, binary complement, shl append, shr, and, or, xor
    p! !true, ~0, 2 << 1, 2 >> 1, true & false, true | false, true ^ false
    # inclusive range, exclusvive range, splat, double splat
    a, b, c = 1, 2, 3
    # named tuples are immutable and by key:value pairs
    # named_tuple = {a, b, c}
    named_tuple = {a: 1, b: 2, c: 3}
    p! 1..10, 1...10, *{1, 2, 3}
    named_tuples_example(1, **named_tuple)
    p! true ? 1 : 2
    # pattern match, no pattern match, case subsumption
    # case subsumption operator checks if the rhs is a member of the set described by the lhs
    # it's asking does the lhs describe or contain the rhs?
    # compiler inserts this in case...when
    p! "foo" =~ /fo/, "foo" !~ /fo/, /foo/ === "foo"
    # nilable index access operator
    p! [1, 2, 3][1]?, [1, 2, 3][4]?

    # number methods that are less common but still useful
    p! -5.abs, 4.3.round, 5.even?, 10.gcd(16)

    # math methods defined in the math namespace
    p! Math.cos(0), Math.sin(0), Math.tan(0), Math.log(4), Math.log10(114), Math.log(312, 5), Math.sqrt(2)
    # some math constants
    p! Math::E, Math::TAU, Math::PI
  end

  def self.string_methods : Nil
    # string interpolation, strings are a sequence of unicode characters in utf-8 and immutable therefore each string modification returns with a new string
    s = "hello"
    # string interpolation, more complex values should be converted to a string using to_s
    p! "#{s} world", (a = Math::PI**Math::E).to_s
    # can also do string concatenation using the + operator
    p! "Hello" + " world"
    # some cant be written within a string so need to use escape sequences
    p! "\"hello\" world"
    # crystal also supports % percent string literals that are:
    # (), [], {}, <>, and || which can all be nested (except ||)
    p! %("Hello" " yoga"), %("Hello" (" abomba"))
    puts %("Hello" (" abomba" " xyz"))
    # really useful for writing strings with stuff like " in them
    puts %("Hello world again")
    # string literal denoted by %q does not apply interpolation nor escapes with %Q has the same meaning as %
    a = "Hello"
    p! %q(#{a} world), %Q(#{a} world)
    # multiline strings
    puts "Hello " \
         "world " \
         "again " \
         "from vegas"
    # backslash followed by a newline can be inserted inside the string literal
    puts "hello \
    world \
    people"
    # HEREDOC string litearls are <<-
    puts <<-XML
    <parent>
      <child>
    </parent>
    XML
    # to apply operations to a heredoc string, just apply it to the opening
    # <<-NAME.method
    puts <<-XML.upcase
    <parent>
      <child>
    </parent>
    XML
    # heredocs allow interpolation or escapes
    puts <<-XML
    <parent>
      <child>#{a} world</child>
    </parent>
    XML

    # unicode
    puts "Hello 私はマークです"

    # check string size, isZeroLength, isEmpty, isEmpty but returns nil if blank otherwise the string itself
    # is blank is only true when all whitespace or empty
    p! "  ".size, "".empty?, "".blank?
    p! "".presence

    # string comparison
    # equality and comparison
    # remember spaceship operator returns 0 if equal, 1 if greater, -1 if less
    p! "foo" == "foo"
    p! "foo" != "foo"
    p! "foo" <=> "foo"
    p! "foo" <=> "bar"
    p! "bar" <=> "foo"

    # equality and comparison
    # remember spaceship on string comparisons is based on character by character comparison
    # == , != , String.compare for case insensitive comparison
    p! "foo" == "foO", "foo" != "foo", "foo".compare("foo")
    # check to see if one string includes another one inside it
    message = "Hello World!"
    # checks in non-case sensitive manner
    p! message.includes?("Crystal"), message.includes?("Hello"), message.includes?("world")
    # start or end of string checks
    p! message.starts_with?("Hello"), message.ends_with?("World!")
    p! message.starts_with?("hello"), message.ends_with?("world!")

    # get index of the start of the subsequence
    p! "Hello world!".index("lo")
    # start searching from an offset from an index
    # returns the index of the first occurrence of index + offset from the start of the string
    p! "Hello world!".rindex("lo", 5)
    # searches from the end of the string
    # only considers from [start, offset]
    p! "Hello world!".rindex("lo", offset: 1)

    # extracting substrings
    message = "Hello world!"
    length_to_extract = 5
    start_index = 6
    p! message[start_index], message[start_index, length_to_extract]
    # say if we want to extract from until the end of the string minus the last n characters
    message = "Hello Crystal!"
    if idx = message.index("!")
      p! message[start_index, message.size - start_index - 1]
    else
      raise "Message does not contain !"
    end

    # however there's a more pythonic way to do this
    p! message[start_index..-1]
    p! message[start_index..(message.size - 2)]

    # string substitution
    # creates a new string with the substitution
    # get address of the original string
    # object_id measures the address of the string
    # pointerof measures the address of the pointer to the string
    p! message.object_id, pointerof(message)
    # pass a search string to then replace it with a replacement string
    message = message.sub("Crystal", "Ruby")
    puts message
    p! message.object_id, pointerof(message)
    # to search for and replace all occurrences of a substring, use gsub
    message = "Hello Crystal! Hello Crystal!"
    p! message.gsub("Crystal", "Ruby")
    return nil
  end

  def self.control_flow : Nil
    # nil is the simplest type and represents the absence of an actual value
    p! "Crystal is awesome".index("aw"), "Crystal is awesome".index("xxx")
    # standard boolean values, true and false
    # standard boolean algebra with:
    # and &&, or ||, not !, inequivalence !=, equivalence ==

    # Truthiness
    # nil, false, and null pointers are falsey
    # any other value is truthy
    p! true && true, true && false, nil && nil

    # control flow
    # condition is met when the return value of the expression is truthy
    # all subsequent expressions are part of the branch until it closes with the "end" keyword
    message = "Hello World!"
    if message.starts_with?("Hello")
      puts "Hello to you, too!"
    end
    if message.starts_with?("Hello") || message.starts_with?("bilge")
      puts "You're either a pirate or saying hello to me?" \
           "\nEither way, yarr harr!"
    else
      puts "Yar harrr!"
    end

    # alternative to if !<expression> is unless <expression>
    unless message.starts_with?("Hello")
      puts "You're not saying hello to me?"
    else
      puts "You did say hello to me? "
    end

    # compiler forces you to handle the nil case in a string search
    str = "Crystal is awesome"
    index = str.index("aw")
    if !index.nil?
      puts str
      puts "#{" " * index}^^"
    end

    # conditionals are with if...else or if...elsif
    # loops are done with while
    counter = 0

    while counter < 10
      counter += 1
      puts "Counter: #{counter}"
    end

    counter = 0
    until counter >= 10
      counter += 1
      if counter == 9
        puts "Counter is 9, breaking out of loop"
        break
      end
      puts "Counter: #{counter}"
    end

    # incrementation can lead to infinite loops if not careful
    # However with things like web servers or schedulers, you need to loop forever
    # in this case, it's more idiomatic to use a while true loop because it's more explicit
    counter = 0
    while counter <= 10
      counter += 1
      if counter % 2 == 0
        next
      end
      puts "Counter: #{counter}"
    end

    return nil
  end

  def self.methods : Nil
    # default value on arguments
    puts greet = ->(name : String) { "Hello, #{name}!" }
    puts greet.call("Doodles")
    return nil
  end

  def self.default_arguments(name : String = "Hello") : Nil
    puts "Hello, #{name}!"
    return nil
  end

  def self.positional_arg_overloading(recipient : String)
    Nil
    puts "Hello, #{recipient}!"
    return nil
  end

  def self.positional_arg_overloading(human_id : Int32) : Nil
    puts "Hello, human #{human_id}!"
    return nil
  end

  def self.adds_2(num : Int32)
    Int32
    # implicit return
    num + 2
  end
end
