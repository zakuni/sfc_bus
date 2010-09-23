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

agent = Mechanize.new
agent.get(url)


agent.page.search('body').each do |elem|
  puts elem.inner_text
end

bus = agent.page.search('table').inner_text
puts bus[0]


agent.page.search('td').each do |elem|
  puts elem.inner_text
end


html.xpath('//td').each do |elem|
  puts elem.content
end


=begin
bus.each{|i|
  puts i
}
=end

# 平日
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=1

#土曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=2

#日曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=3
