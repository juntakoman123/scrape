require 'nokogiri'
require 'open-uri'

# 対象のURL
url = "https://www.youtube.com/watch?v=AeB6SOvka44"

# NokogiriでURLの情報を取得する
contents = Nokogiri::HTML(open(url),nil,"utf-8")

puts contents
