require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:pie) {Dessert.new("pie", 5, chef)}

  describe "#initialize" do

    it "sets a type" do
      expect(pie.type).to eq("pie")
    end
    it "sets a quantity" do
      expect(pie.quantity).to eq(5)
    end
    it "starts ingredients as an empty array" do 
      expect(pie.ingredients).to match_array([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("some", "more", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      pie.add_ingredient("flour")
      expect(pie.ingredients).to match_array(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      pie.add_ingredient("butter")
      pie.add_ingredient("eggs")
      pie.add_ingredient("milk")
      pie.mix!
      expect(pie.ingredients).to_not match_array(["flour", "butter", "eggs", "milk"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pie.eat(4)
      expect(pie.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { pie.eat(6) }.to raise_error(StandardError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Don the Great Baker")
      expect(pie.serve).to include("Chef Don the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end
end
