class GraphNode
   attr_accessor :neighbors
   attr_reader :value
   
   def initialize(value, neighbors = [])
      @value = value
      @neighbors = neighbors
   end

   def add_neighbor(neighbor)
      self.neighbors << neighbor
   end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs(starting_node, target_value)
   queue = starting_node.neighbors
   visited = [starting_node]
   return starting_node if starting_node.value == target_value
   while !queue.empty?
      node = queue.shift
      return node if node.value == target_value
      these = node.neighbors
      visited << node
      queue += these.reject{|neigh| visited.include?(neigh)}
   end
   nil
end

p bfs(a, "f")