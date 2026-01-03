require "set"

class RelativeDistance
  @graph : Hash(String, Set(String))

  def initialize(family_tree : Hash(String, Array(String)))
    @family_tree = family_tree
    @graph = build_graph(@family_tree)
  end

  def degree_of_separation?(person_a : String, person_b : String) : Int32?
    return 0 if person_a == person_b
    return nil unless @graph.has_key?(person_a) && @graph.has_key?(person_b)

    visited = Set(String).new
    visited << person_a

    queue = [{person_a, 0}] of Tuple(String, Int32)
    head = 0

    while head < queue.size
      current, distance = queue[head]
      head += 1

      @graph[current].each do |neighbor|
        next if visited.includes?(neighbor)

        next_distance = distance + 1
        return next_distance if neighbor == person_b

        visited << neighbor
        queue << {neighbor, next_distance}
      end
    end

    nil
  end

  private def build_graph(family_tree : Hash(String, Array(String))) : Hash(String, Set(String))
    graph = Hash(String, Set(String)).new { |hash, key| hash[key] = Set(String).new }

    family_tree.each do |parent, children|
      graph[parent]

      children.each do |child|
        graph[child]
        graph[parent] << child
        graph[child] << parent
      end

      # Siblings are considered 1 degree apart.
      children.each_with_index do |child, i|
        (i + 1...children.size).each do |j|
          sibling = children[j]
          graph[child] << sibling
          graph[sibling] << child
        end
      end
    end

    graph
  end
end
