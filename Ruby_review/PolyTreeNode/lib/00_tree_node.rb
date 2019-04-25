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
