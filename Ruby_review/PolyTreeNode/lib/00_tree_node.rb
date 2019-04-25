class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        if self.parent
            self.parent.children.delete(self)
        end

        @parent = parent_node
        @parent.children << self unless @parent.nil? || @parent.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "this child does not exist" unless child_node.parent
        child_node.parent = nil
    end
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 3c1481f4fe00677ca2a09a32d8f88e2d637a71f1
# end

# class Searchable

    # def dfs(target = nil)
    #     return self if self == target
    #     self.children.each do |child|
    #         result = child.dfs(target= nil)
    #         return result unless result.nil?
    #     end
    #     nil
    # end
<<<<<<< HEAD
>>>>>>> 3c1481f4fe00677ca2a09a32d8f88e2d637a71f1
=======
>>>>>>> 3c1481f4fe00677ca2a09a32d8f88e2d637a71f1

    def dfs(target)
        return self if @value == target

        self.children.each do |child|
            result = child.dfs(target)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            node = queue.shift
            return node if node.value == target
            queue += node.children
        end
        nil
    end
end