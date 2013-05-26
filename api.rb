require 'open-uri'
require 'json'
require 'pp'

latitude =  43.0389
longitude = -87.9064
sensor = false
keyword = "food"
radius = 50000
key = "AIzaSyBH11S2JGj5NBPghmgdid4Z7PXHM8RTFhI"
api_call = "https://maps.googleapis.com/maps/api/place/nearbysearch/json\?&location\=#{latitude},#{longitude}&radius\=#{radius}&sensor\=#{sensor}&key\=#{key}&keyword=#{keyword}"

file = File.open('json.txt', 'r').read
jdoc = JSON.parse(file)
#jdoc = JSON.parse(open(api_call).read)

jdoc.fetch("results").each do |item|
  puts item.fetch("name")
end