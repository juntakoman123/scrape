require 'nokogiri'
require 'open-uri'

# 対象のURL
url = "https://daidata.goraggio.com/100203/unit_list?model=%EF%BE%8A%EF%BE%9E%EF%BD%BC%EF%BE%9E%EF%BE%98%EF%BD%BD%EF%BD%B8+%E7%94%B2%E8%B3%80%E5%BF%8D%E6%B3%95%E5%B8%96+%E7%B5%86&ballPrice=20.00&hist_num=&disp=2&graph=2"


#n = [1731,1732,]
#url = "https://daidata.goraggio.com/100203/detail?unit=" + n
#urls = []
# Nokogiriで切り分け
doc = Nokogiri::HTML(open(url))
#element_h1 = html.css('.hoge_class')
puts "### xpathノードを検索する"
slot_num = doc.xpath('//*[@id="Prime-Column"]/article/section/ul/li/a/p/span')
slotnums = slot_num.to_s.scan(/\d+/)

slotnums.each do |num|
  url2 = "https://daidata.goraggio.com/100203/detail?unit=" + num
  doc2 = Nokogiri::HTML(open(url2))

#ここは共通　開始ゲームだけ取得する
  start_num = doc2.xpath('//*[@id="Prime-Column"]/article/section[1]/div[1]/table/tr[2]/td[3]')
  puts "#{num}: " + start_num.text
end

#puts start_num.text

#ｃｈｒｏｍｅ先生勝手にtbodyを階層で補助してくれるからそれがエラーになるらしい
