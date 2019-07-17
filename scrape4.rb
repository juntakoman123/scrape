require 'nokogiri'
require 'open-uri'

url = "http://m.site777.jp/f/D4000.do?pmc=18009002&dtdd=0&dn=65&mdc=119608"

user_agent = { "User-Agent" => "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; ja) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C25 Safari/419.3" }
doc = Nokogiri::HTML(open(url,user_agent))
puts doc
