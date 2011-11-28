require "rbtree"

module Warpaint
  class Warpaint::OrderedCollection < RBTree
    def closest_to(key)
      lower = lower_bound(key)
      upper = upper_bound(key)

      return upper if lower.nil?
      return lower if upper.nil?

      (upper[0] - key).abs > (lower[0] - key).abs ? lower : upper
    end
  end
end