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

# Place name
  puts item.fetch("name")
  reference = item.fetch("reference")

# Snag place details
  ref_api_call = "https://maps.googleapis.com/maps/api/place/details/json\?&sensor\=#{sensor}&key\=#{key}&reference=#{reference}"
  ref_jdoc = JSON.parse(open(ref_api_call).read)
 
# Iterate through Place formatted address and blank out the last entry (i.e. country)
  ref_jdoc.fetch("result").fetch("formatted_address").split(", ").each() do |value|
    puts value.gsub(/United States/,"")
  end
 
# phone number
 puts ref_jdoc.fetch("result").fetch("formatted_phone_number")
  puts "-" * 40


#  puts item.fetch("vicinity")
#  item.fetch("types").each do |value|
#    print value, ', '
#  end
#  puts "\n"
#  puts "=" * 80
end