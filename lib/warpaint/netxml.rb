require "warpaint/parser"
require "nokogiri"
require "time"

module Warpaint
  class NetXML < Warpaint::Parser
    def parse_into(struct)
      File.open(@input_file) do |f|
        doc = Nokogiri::XML(f)

        doc.xpath("//wireless-network[@type='infrastructure'][SSID]").each do |net|
          last_time = net.attribute("last-time").value
          encryption = net.xpath("SSID/encryption").children.to_s

          ssid = net.xpath("SSID/essid[@cloaked='false']")
          if !ssid.empty?
            essid = ssid.children.to_s
            struct.add_wireless_network(:last_time => Time.parse(last_time), :essid => essid, :encryption => encryption)
          end
        end
      end
    end
  end
end