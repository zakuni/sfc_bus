# -*- coding: utf-8 -*-
require "rubygems"
require "date"
require "date4"
require "date4/holiday"
require "kconv"

t =  Time.now
puts t

up_normal = Array.new                                                                              
up_normal[15..23] = ["16 24 31 43 56", #15hour 
                  "08 13 25 38 50", #16                                                            
                  "10 23 35 48 55", #17                                                            
                  "08 20 40 47",    #18                                                            
                  "07 20 30 40 50", #19                                                            
                  "00 10 20 30 40 50",#20                                                          
                  "00 15 30 50",    #21                                                            
                  "10 30 50",       #22                                                            
                  "15"]             #23                                                            
                                              

if Date4.today.national_holiday? or (Date.today.wday == 0)
  puts "休日ダイヤ"
  d = up_normal
elsif Date.today.wday == 6
  puts "土曜ダイヤ"
else  
  puts "平日ダイヤ"
  d = up_normal
end


puts d[t.hour]

# 平日
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=1

#土曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=2

#日曜
#http://dia.kanachu.jp/bus/timetable?busstop=24201&pole=1&pole_seq=1&apply=2010/09/16&day=3
