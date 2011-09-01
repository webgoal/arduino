require 'rss'
require 'open-uri'

rss_feed = ""
rss_content = ""

open(rss_feed) do |f|
   rss_content = f.read
end

rss = RSS::Parser.parse(rss_content, false)

puts "Status: #{rss.items.first.title.split(/\s/).last}\n"

# puts "Title: #{rss.channel.title}"
# puts "RSS URL: #{rss.channel.link}"
# puts "Total entries: #{rss.items.size}"

# rss.items.each do |item|
#   puts "<a href='#{item.link}'>#{item.title}</a>"
#   puts "Published on: #{item.date}"
#   puts "#{item.description}"
# end

