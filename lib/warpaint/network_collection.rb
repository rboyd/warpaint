require "warpaint/ordered_collection"

module Warpaint
  class Warpaint::NetworkCollection < Warpaint::OrderedCollection
    def initialize(time_adjustment = 0)
      @time_adjustment = time_adjustment
      super
    end

    def add_wireless_network(network)
      self[network[:last_time] + @time_adjustment] = { :essid => network[:essid], :encryption => network[:encryption] }
    end
  end
end