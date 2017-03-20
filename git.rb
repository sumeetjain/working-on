require 'net/http'
require 'pry'
require 'nokogiri'
require 'json'
require 'open-uri'
require 'github_api'






# this is how to get the image through nokogiri
doc = Nokogiri::HTML(open('https://github.com/sumeetjain'))
images = doc.css('img')
profile_pic = images[0]["src"]

# user = 'sumeetjain'

# uri = URI('https://github.com/'+user)
# dump = Net::HTTP.get(uri)

# def set_pic_url
#   git_thing = Github.new
#   user_dump = git_thing.repos.list user: 'malastrumdominisui'
#   self.git_url = user_dump.body[0]["owner"]["avatar_url"]
# end 
