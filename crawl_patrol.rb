require 'faraday'
require 'nokogiri'

class CrawlPatrol

    def get_episode_titles
        response = Faraday.get 'http://www.nickjr.de/paw-patrol/videos/'
        doc = Nokogiri::HTML(response.body)
        class_name = 
        
        stream_items = all_items_with_class(doc, "stream-block-item")

        episodes = stream_items.reject { |item| item.xpath('./a/div/div/div[@class="stream-label stream-tile-flag tile-episode-flag"]').empty?}

        episodes.map { |episode| episode.xpath('./div/b[@class="tooltip-title"]').inner_text}
    end

    private

    def all_items_with_class(parent_node, class_name)
        parent_node.xpath("//div[contains(concat(' ', normalize-space(@class), ' '), ' #{class_name} ')]")
    end
end