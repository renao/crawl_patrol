require 'faraday'
require 'nokogiri'

class CrawPatrol

    def crawl_for_new
        response = Faraday.get 'http://www.nickjr.de/paw-patrol/videos/'
        doc = Nokogiri::HTML(response.body)
        class_name = "tile-episode-flag"
        
        episode_markers = doc.xpath("//*[contains(concat(' ', normalize-space(@class), ' '), ' #{class_name} ')]")

        puts episode_markers
    end
end

patrol = CrawPatrol.new

patrol.crawl_for_new