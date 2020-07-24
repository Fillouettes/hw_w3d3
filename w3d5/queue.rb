class Queue
   def initialize
      @q = []
   end
   
   def enqueue(el)
      @q.unshift(el)
   end

   def dequeue
      @q.pop
   end

   def peek
      @q.last
   end
end