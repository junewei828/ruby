def bfs(root, target)
    queue = [root]
    until queue.empty?
        node = queue.shift
        return node if node.value == target
        queue += node.children  # or node.children.each { |child| queue << child }
    end 
    nil
end

def dfs(root, target)
    return nil if root.nil?
    return root if root.value == target

    root.children.each do |child|
        search_result = dfs(child, target)
        return search_result unless search_result.nil?
    end
    nil
end
