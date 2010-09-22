# -*- coding: utf-8 -*-
require "open-uri"
require "date"
require "date4"
require "date4/holiday"
require "nokogiri"
require "mechanize"
require "kconv"

d = Date.today
puts d

p Date4.today.national_holiday?


url = "http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day="
if Date4.today.national_holiday?
  url << "3"
  puts "today is sunday"
else
  url << "1"
end
open(url) do |f|
#  print f.read
end

html = Nokogiri::HTML(open(url), nil, 'UTF-8')
#puts html.xpath("//table//td[@width]")
puts html.search("table")

agent = Mechanize.new
agent.get(url)
puts '<table>:'
agent.page.search('table').each do |elem|
  puts elem.inner_text
end
puts url
puts 'なななな'
puts html.at('td.vs')
agent.page.search('body').each do |elem|
  puts elem.inner_text
end
puts 'らららら'
agent.page.search('td[@class=vs]').each do |elem|
  puts elem.inner_text
end


#parse(thing, url=url, encoding = nil, options = XML::ParseOptions::DEFAULT_HTML, &block)

=begin
puts html.class

puts html.fragment(tags = 'table')

puts html.type

puts html.document

puts html.block?
=end

#puts html.html("td")

=begin
html.search('table').each do |link|
  puts link.content
end


#puts html.search("td")
puts html.css('#vs').map do |elm|
  elm.content
end
=end


# 平日
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=1

#土曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=2

#日曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=3
