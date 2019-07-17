require 'nokogiri'
require 'open-uri'

# 対象のURL
url = "https://www.sejuku.net/blog/"

# Nokogiriで切り分け
doc = Nokogiri::HTML(open(url))

puts "### CSSノードを検索する"
doc.css('h2').each do |link|
  puts link.content
end

puts "### xpathノードを検索する"
doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
  puts link.content
end

puts "### ミックスされたノードを検索する."
doc.search('nav ul.menu li a', '//article//h2').each do |link|
  puts link.content
end
