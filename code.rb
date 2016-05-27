require "nokogiri"
require "pry"
require 'net/http'
require 'uri'

source = Net::HTTP.get('launch-academy-chat.herokuapp.com', '/messages')

messages = ""
page = Nokogiri::HTML(source)
page.css("div.pure-u-1-2").each do |content|
  messages += content
end
puts messages

##posting a new message
uri = URI.parse("http://launch-academy-chat.herokuapp.com/messages")
post = Net::HTTP.post_form(uri, "content" => "what's good")
puts post
