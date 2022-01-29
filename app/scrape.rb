require_relative 'KakakuScraper'
require_relative 'MobilePhone'

scraper = KakakuScraper.new()

puts 'scrape begin'
data = scraper.scrape
puts 'scrape ended'

puts '------------------'

puts 'saving to db...'
data.each_with_index {|datum, i|
  mobile_phone = MobilePhone.new()
  mobile_phone.maker = datum[:maker]
  mobile_phone.name = datum[:name]
  mobile_phone.ranking = i + 1
  mobile_phone.save
}

puts 'saved!'
