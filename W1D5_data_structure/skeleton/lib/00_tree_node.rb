
class PolyTreeNode
    attr_reader :value, :parent, :children 

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        old_parent = self.parent

        if old_parent
            old_parent.children.delete(self)
        end

        @parent = parent_node
        parent_node.children << self unless parent_node.nil? || parent_node.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "this child does not exist!" unless child_node.parent
        child_node.parent = nil
    end

    def dfs(target = nil, &prc)
        prc ||= Proc.new { |node| node.value == target }

        return self if prc.call(self)

        children.each do |child|
        result = child.dfs(&prc)
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