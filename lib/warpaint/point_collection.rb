require "warpaint/ordered_collection"

module Warpaint
  class Warpaint::PointCollection < Warpaint::OrderedCollection
    def initialize(time_adjustment = 0)
      @time_adjustment = time_adjustment
      super
    end

    def add_track_point(point)
      self[point[:time] + @time_adjustment] = { :lat => point[:lat], :lon => point[:lon] }
    end
  end
end