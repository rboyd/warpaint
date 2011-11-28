require "kamel"

module Warpaint
  class Warpaint::Renderer
    def initialize(networks, track_points)
      @networks = networks
      @track_points = track_points
    end

    def render_to(f)
      overlay = Kamel::Overlay.new
      overlay.name = "Wireless Networks"
      @networks.each do |time, access_point|
        time_point_pair = @track_points.closest_to(time)
        trackpoint = time_point_pair[1]

        overlay.placemark!(
          :name        => access_point[:essid],
          :description => "This is an access point",
          :location    => { :lng => trackpoint[:lon], :lat => trackpoint[:lat] },
          :icon        => "http://a.yfrog.com/img861/7242/hjvc.png"
        )
      end

      f.write(overlay.to_kml)
    end
  end
end