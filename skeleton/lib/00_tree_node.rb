require 'byebug'

class PolyTreeNode

  attr_reader :value, :parent, :children
#<PolyTreeNode:0x00007fa54381c5a0 @children=[], @parent=nil, @value="root">
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node
      self.parent.children.delete(self) if self.parent
      @parent = node
      node.children << self unless node.children.include?(self)
    else
      self.parent.children.delete(self)
      @parent = nil
    end
  end

  def add_child(node)
    # self.children << node
    node.parent = self #unless node.parent == self


  end

  def move_child
  end

  def remove_child(node)
    self.children.delete(node)
    node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty?

    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end
    nil
  end

  def bfs(target_value)

    queue = [self]

    until queue.empty?
      node = queue.shift
      if node.value == target_value
        return node
      elsif
        queue.concat(node.children)
      end
    end
    nil
  end

end
