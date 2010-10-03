# -*- coding: utf-8 -*-
require "rubygems"
require "open-uri"
require "date"
require "date4"
require "date4/holiday"
require "nokogiri"
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


html = Nokogiri::HTML(open(url), nil, 'UTF-8')

nakami = Array.new
i = 0

tds = html.xpath('//tr').map{|elem|
  puts elem.content
}


puts tds.length

tds.delete_if{|x| x =~ /\D/ }


puts nakami.class


# 平日
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=1

#土曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=2

#日曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=3
