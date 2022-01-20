require 'nokogiri'
require 'open-uri'

class KakakuScraper
  def initialize
    @url = 'https://kakaku.com/keitai/smartphone/'
  end
  def scrape
    page = URI.open(@url)
    data = Nokogiri::HTML(page)
    list = data.at('#keitai .l-c .p-scrollFix_wrap .l-c-2column_cont div .p-list')
    items = list.children
    data = []
    items.each{|item|
      info = item.css('.p-list_info')

      maker = info.at('div .p-list_maker')
      maker_text = maker.text unless maker.nil?

      name = info.at('.p-list_name a')
      name_text = name.text unless name.nil?

      data.append({:maker => maker_text, :name => name_text}) unless name_text.nil? or maker_text.nil?
    }

    data
  end
end
