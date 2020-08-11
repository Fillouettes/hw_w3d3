class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end


class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
    snack_box.methods.grep(/^get_(.*)_info$/) { MetaCorgiSnacks.define_snack $1 }
  end

  # def method_missing(name, *args)
  #   @treat = name.to_s
  #   if ['bone', 'kibble', 'treat'].include?(@treat)
  #       info = @snack_box.send("get_#{@treat}_info", @box_id)
  #       tastiness = @snack_box.send("get_#{@treat}_tastiness", @box_id)
  #       result = "Treat: #{@treat}: #{tastiness} "
  #       tastiness > 30 ? "* #{result}" : result
  #   else
  #     super
  #   end
  # end

  def self.define_snack(name)
    define_method(name) do
      info = @snack_box.send("get_#{name}_info", @box_id)
      tastiness = @snack_box.send("get_#{name}_tastiness", @box_id)
      result = "Treat: #{info}: #{tastiness} "
      tastiness > 30 ? "* #{result}" : result
    end
  end

end

snack_box = SnackBox.new
snacks = MetaCorgiSnacks.new(snack_box, 1)
p snacks.bone


# #________________________________________________________________________________________

#   class Dog
#   # defines a class method that will define more methods; this is
#   # called a **macro**.

#   def self.makes_sound(name)
#     define_method(name) { puts "#{name}!" }
#   end

#   makes_sound(:woof)
#   makes_sound(:bark)
#   makes_sound(:grr)
# end

# dog = Dog.new
# dog.woof
# dog.bark
# dog.grr

#________________________________________________________________________________________

  # def self.create_tricks(*trick_names) # define this class method
  #   # this type of method is called a "macro" - mapping a certain pattern of behavior, a method defining a method, a subset of the tools we have in metaprogramming

  #   # order of execution matters - we can use this method to overwrite methods that were defined when defining the Dog class if we run it later

  #   # 1 self? - Dog class (this is a class method definition)
  #   trick_names.each do |trick_name| # and for each trick_name we give
  #       # 2 self? - Dog Class still! We're not defining the each method here
  #       self.define_method(trick_name) do |num = 1| # define a method with default argument of 1 (self here is still the class to be able to call the define_method method)
  #           # 3 self? - self is the INSTANCE here as define_method is defining an instance method!
  #           num.times do # that defined method will puts <trick_name>ing num times

  #               puts "#{trick_name}ing!"

  #           end

  #       end

  #   end

  # end

#________________________________________________________________________________________


# class Cat
#   def say(anything)
#     puts anything
#   end

#   def method_missing(method_name)
#     method_name = method_name.to_s
#     if method_name.start_with?("say_")
#       text = method_name[("say_".length)..-1]

#       say(text)
#     else
#       do the usual thing when a method is missing (i.e., raise an
#       error)
#       super
#     end
#   end
# end

# earl = Cat.new
# earl.say_hello # puts "hello"
# earl.say_goodbye # puts "goodbye"