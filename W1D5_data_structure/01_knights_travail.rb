class PolyTreeNode
    attr_reader :value, :children, :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        old_parent = self.parent
        
        if old_parent
            self.parent.children.delete(self)
        end

        @parent = parent_node
        @parent.children << self unless @parent.nil? || @parent.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "this child does not exist" unless self.children.include?(child_node)
        self.children.delete(child_node)
    end

end