class LinkedList
	attr_accessor :head, :tail
	def initialize
		@head = nil
		@tail = nil
	end

	#Helper method to set @head and @tail if no nodes are in the list
	def head_and_tail(node)
		@head, @tail = node, node
	end

	def append(value)
		node = Node.new(value)
		return head_and_tail(node) if @tail.nil?
		@tail.next_node, @tail = node, node
	end	

	def prepend(value)
		node = Node.new(value)
		return head_and_tail(node) if @head.nil?
		node.next_node, @head = @head, node
	end

	def size
		return 0 if @head.nil?
		count, current = 1, @head
		until current.nil?
			current = current.next_node
			count += 1
		end
		return count
	end

	def at(idx)
		count, current = 0, @head
		until count == idx
			current = current.next_node
			count += 1
		end
		return current
	end

	def pop
		current = @head
		loop do 
			if current.next_node == @tail
				current.next_node = nil
				@tail = current
				break
			end
			current = current.next_node
		end
	end

	def contains?(data)
		current = @head
		until current.nil?
			return true if current.value == data
			current = current.next_node
		end
		return false
	end

	def find(data)
		count, current = 0, @head
		loop do 
			if current.value == data
				return count
			elsif current.nil?
				return nil
			else
				current = current.next_node
				count += 1
			end
		end
	end

	def to_s
		string, current = "", @head
		until current.nil?
			string += "( #{current.value} ) -> "
			string += "nil" if current.next_node.nil?
			current = current.next_node
		end
		return string
	end

	def insert_at(data, idx)
		node = Node.new(data)
		counter, current = 0, @head
		loop do 
			if counter == idx - 1
				node.next_node = current.next_node
				current.next_node = node
				break
			end
			current = current.next_node
			counter += 1
		end
	end

	def remove_at(idx)
		counter, current = 0, @head
		loop do 
			if counter == idx - 1
				current.next_node = current.next_node.next_node
				break
			end
			current = current.next_node
			counter += 1
		end
	end

end

class Node
	attr_accessor :value, :next_node
	def initialize(value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end
end
