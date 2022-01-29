require_relative 'MobilePhone'

def record_parser(record)
  "Rank: (#{record.ranking}) | Maker: #{record.maker} | Model Name: #{record.name}"
end
  
today = Date.parse(Time.now.strftime('%Y-%m-%d'))
records_today = MobilePhone.where(:created_at => today.beginning_of_day..today.end_of_day)
if records_today.length == 0
  require_relative 'scrape'
  records_today = MobilePhone.where(:created_at => today.beginning_of_day..today.end_of_day)
end


puts "Today's latest rankings"
records_today.each{|record|
  puts record_parser(record)
}
