require 'set'

def sluggish_octopus(arr)
   arr.each do |fish|
      longer_fish = arr.select { |fsh| fsh.length > fish.length }
      return fish if longer_fish.empty?
   end
end


arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# p sluggish_octopus(arr)

def dominant_octopus(arr)
   merge_sort(arr).last
end

def merge_sort(arr)
   return arr if (arr.length < 2)
   middle = arr.length / 2
   left = merge_sort(arr.take(middle))
   right = merge_sort(arr.drop(middle))
   merge(left, right)
end

def merge(arr1, arr2)
   merged = []
   until (arr1.empty? || arr2.empty?)
      if (arr1.first.length <=> arr2.first.length) == -1
         merged << arr1.shift
      else 
         merged << arr2.shift
      end
   end
   merged + arr1 + arr2
end

# p dominant_octopus(arr)

def clever_octupus(arr)
   biggest = arr.first
   arr.each { |fish| biggest = fish if biggest.length < fish.length }
   biggest
end

# p clever_octupus(arr)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles)
   tentacle = 0
   tiles.each_with_index { |tile, index| tentacle = index if dir == tile }
   tentacle
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7}

def fast_dance(dir, tiles)
   tiles[dir]
end

# p fast_dance("up", tiles_hash)
# p fast_dance("right-down", tiles_hash)