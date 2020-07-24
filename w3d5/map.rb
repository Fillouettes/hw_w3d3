class Map
   def initialize
      @m = []
   end

   def set(key, value)
      if @m.any? {|pair| pair[0] == key }
         @m.each {|pair| pair[1] = value if pair[0] == key}
      else
         @m << [key, value]
      end
   end

   def get(key)
      @m.each {|pair| return pair[1] if pair[0] == key}
   end

   def delete(key)
      @m.each {|pair| @m.delete(pair) if pair[0] == key}
   end

   def show #I don't know what show should do, so I am printing the keys
      @m.each {|pair| p pair[0]}
   end
end