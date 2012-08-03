#!/usr/bin/ruby1.9.1

require 'date'
require 'csv'

if ARGV.length != 5
  puts "Usage: filecreator.rb <doc prefix> <start> <end> <fields> <defaults>"
  exit
end

prefix = ARGV[0]
dirName = prefix + "_" + ARGV[1] + "_" + ARGV[2]

Dir.mkdir(dirName)

psdDate = Date.today + 10

csvFileName = dirName + "/" + dirName + ".csv"

defaults = Hash[*File.read(ARGV[4]).split(/,|\n/)]

headers = []
body = []
File.foreach(ARGV[3]) do |fieldName|
	headers << 	fieldName.chop
	body << defaults.fetch(fieldName.chop, "")
end

CSV.open(csvFileName, "w", :force_quotes => true) do |csv|
	csv.add_row(headers)
	csv.add_row(body)
end


