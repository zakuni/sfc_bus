# -*- coding: utf-8 -*-
require "rubygems"
require "date"
require "date4"
require "date4/holiday"
require "kconv"

d = Date.today
puts d

p Date4.today.national_holiday?


if Date4.today.national_holiday?
  puts "today is sunday"
else
  url << "1"
end


nakami = Array.new
nakami[15..23] = ["16 24 31 43 56", #15hour
                  "08 13 25 38 50", #16
                  "10 23 35 48 55", #17
                  "08 20 40 47",    #18
                  "07 20 30 40 50", #19
                  "00 10 20 30 40 50",#20
                  "00 15 30 50",    #21
                  "10 30 50",       #22
                  "15"]             #23

puts nakami.class
puts nakami

# 平日
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=1

#土曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=2

#日曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=3
