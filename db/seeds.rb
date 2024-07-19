require 'rest-client'
require 'json'

def api_key
  ENV['key']
end

google_id = '102466684172017991017'
url = "https://www.googleapis.com/books/v1/users/#{google_id}/bookshelves/4?key=#{api_key}"

response = RestClient.get(url)
data = JSON.parse(response.body)

puts data
