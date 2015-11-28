require 'set'

class NodeWithWeight
  include Comparable

  attr_accessor :weight
  attr_accessor :node
  attr :min_distance
  attr :predecessors

  def initialize(node, weight)
    @node = node
    @weight = weight
  end

  def <=>(other)
    @weight <=> other.weight
  end
end

class Dijkstra
  attr_reader :adj_list
  attr_reader :min_distance
  attr_reader :predecessors

  def initialize(n)
    @min_distance = Array.new(size = n+1, default = 1 << 31)
    @predecessors = Array.new(size = n+1, default = nil)
    @adj_list = Array.new(n+1)
    @node_list = Array.new(n+1)
    @queue = SortedSet.new
    n.times do |i|
      node = NodeWithWeight.new(i+1, @min_distance[i+1])
      @queue.add node
      @node_list[i+1] = node
    end
  end

  def add_edge(from, to, weight)
    list = @adj_list[from] || Hash.new
    return if list.has_key? to and list[to] <= weight
    list[to] = weight
    @adj_list[from] = list
  end

  def relax(from, to)
    if @min_distance[to] > @min_distance[from] + @adj_list[from][to]
      @min_distance[to] = @min_distance[from] + @adj_list[from][to]
      @node_list[to].weight = @min_distance[to]
      @predecessors[to] = from
    end
  end

  def solve(s)
    @min_distance[s] = 0
    @node_list[s].weight = @min_distance[s]
    @done = Set.new
    while @queue.length > 0
      from = @queue.first
      @queue.delete from
      @done.add from
      @adj_list[from.node].each do |to, _|
        relax(from.node, to)
      end
    end
  end
end


t = gets.to_i
t.times do
  n, m = gets.split.map(&:to_i)
  dijkstra = Dijkstra.new(n)

  m.times do
    x, y, r = gets.split.map(&:to_i)
    dijkstra.add_edge(x, y, r)
    dijkstra.add_edge(y, x, r)
  end

  s = gets.to_i

  dijkstra.solve(s)

  results = Array.new
  n.times do |i|
    unless i+1 == s
      if dijkstra.min_distance[i+1] == 1 << 31
        results.push -1
      else
        results.push dijkstra.min_distance[i+1]
      end
    end
  end
  puts results.join ' '
end