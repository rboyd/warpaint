require "warpaint/parser"
require "nokogiri"
require "time"

module Warpaint
  class GPX < Warpaint::Parser    
    def parse_into(struct)
      File.open(@input_file) do |f|
        doc = Nokogiri::XML(f)

        doc.xpath("//xmlns:trkpt").each do |trkpt|
          struct.add_track_point(:time => Time.parse(trkpt.child.content), :lat => trkpt["lat"], :lon => trkpt["lon"])
        end
      end
    end
  end
end