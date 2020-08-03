class LRUCache
def initialize(size)
    @cache = Array.new(size)
    @size = size
end

def count
    # returns number of elements currently in cache
    count = 0
    cache.each {|el| count += 1 if el}
    count
end

def add(el)
    # adds element to cache according to LRU principle
    cache.push(el) if !cache.include?(el)
    cache.shift until cache.length == size
end

def show
    # shows the items in the cache, with the LRU item first
    cache.each {|el| p " #{el},"}
end

private
# helper methods go here!
attr_reader :size
attr_accessor :cache

end


johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]