require 'rest-client'
require 'json'

def api_key
  ENV['key']
end

google_id = '102466684172017991017'
url = "https://www.googleapis.com/books/v1/users/#{google_id}/bookshelves/4/volumes?key=#{api_key}"

response = RestClient.get(url)
data = JSON.parse(response.body)

# Check if the response contains items
if data["items"]
  data["items"].each do |item|
    title = item["volumeInfo"]["title"]
    author = item["volumeInfo"]["authors"][0]

    puts "Title: #{title}\nAuthors: #{author}"
  end
else
  puts "No books found in the shelf."
end
