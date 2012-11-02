#Web scraping with wrest is pretty fun. System interface is easy
# http://wrest.rubyforge.org/
# 
# calls can be made just with shooting strings
# "http://google.com".to_uri.get.get.body
#
# and then maybe throw that guy into nokogiri
#
# blah = "http://google.com".to_uri.get.body
# parsed = Nokogiri::HTML(blah)
# parsed.class should be 
# => Nokogiri::HTML::Document 
#
# Let's go!
#
require 'wrest'
require 'nokogiri'

if ARGV.length.zero?
  p "Please pass a valid web address ex: taivara.com"
end

addr = "http://"+ARGV[0]

begin
  req_body = addr.to_uri.get.body
rescue NoMethodError
  p "Couldn't fetch the address #{addr} , maybe you mistyped it ?"

rescue SocketError
  p "Sorry, couldn't find that address (DNS error)"
end

#parse with Nokogiri

parsed = Nokogiri::HTML req_body

#print out all the links on the page, just for example:
parsed.css('a').each {|x| p x.attributes['href'].value}
