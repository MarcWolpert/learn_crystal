# require "Random"

module LearnCrystal_Exceptions_TypeAutocasting
  class MyException < Exception
  end

  class MyOtherException < Exception
  end

  class MyThirdException < Exception
  end

  def self.exception : Nil
    begin
      if Random.rand(2) % 2 == 0
        raise MyException.new("MyException")
      else
        raise MyOtherException.new("MyOtherException")
      end
      raise "Oh NO!"
    rescue ex : MyException | MyThirdException
      puts "Rescued myexception error"
    rescue ex : MyOtherException
      puts "Rescued myotherexception error"
    else
      puts "generic rescue"
    ensure
      puts "made sure to run this code"
    end
  end
end
