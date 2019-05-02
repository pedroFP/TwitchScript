require "httparty"
require "json"

puts "Write your favourite streamer name (acording to twitch urls)"

name = gets.chomp!

my_url = "https://api.twitch.tv/kraken/channels/#{name}"

file = File.read('my_json.json')

data_hash = JSON.parse(file)

puts data_hash

def send_request(url, client_id)
	HTTParty.get(url, headers: client_id)  
end

data = send_request(my_url, data_hash)


puts "Streamer:  #{data["display_name"]} | Game: #{data["game"]} |  Views: #{data["views"]} |  Twitch Title: #{data["status"]}"
