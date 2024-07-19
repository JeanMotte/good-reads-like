require 'rest-client'
require 'json'
require 'dotenv/load'  # This will load environment variables from the .env file

def api_key
  ENV['API_KEY']  # Make sure your .env file has the key in the format: API_KEY=your_api_key
end

google_id = '102466684172017991017'
url = "https://www.googleapis.com/books/v1/users/#{google_id}/bookshelves/4/volumes?key=#{api_key}"

begin
  response = RestClient.get(url)
  data = JSON.parse(response.body)

  # Check if the response contains items
  if data["items"]
    data["items"].each do |item|
      volume_info = item["volumeInfo"]

      title = volume_info["title"]
      author = volume_info["authors"] ? volume_info["authors"][0] : "Unknown"
      description = volume_info["description"] || "No description available"
      photo_url = volume_info["imageLinks"] ? volume_info["imageLinks"]["thumbnail"] : "No image available"
      publisher = volume_info["publisher"] || "Unknown"
      published_date = volume_info["publishedDate"] ? Date.parse(volume_info["publishedDate"]).strftime('%d/%m/%Y') : "Unknown"
      page_number = volume_info["pageCount"] ? volume_info["pageCount"].to_i : "Unknown"

      puts "Title: #{title}"
      puts "Author: #{author}"
      puts "Description: #{description}"
      puts "Publisher: #{publisher}"
      puts "Photo URL: #{photo_url}"
      puts "Published Date: #{published_date}"
      puts "Page Number: #{page_number}"
      puts "---------------------------"

      # Need to deal with the authors and categories list so that I can create books without foreign keys
      # Book.create!(title: title, author: author, description: description, photo: photo_url, publisher: publisher, published_date: published_date, number_of_pages: page_number)
    end
  else
    puts "No books found in the shelf."
  end
rescue RestClient::Forbidden => e
  puts "Access denied. Please check your API key and permissions."
  puts e.response
rescue RestClient::ExceptionWithResponse => e
  puts "An error occurred: #{e.response}"
rescue JSON::ParserError => e
  puts "Failed to parse JSON response: #{e.message}"
rescue => e
  puts "An unexpected error occurred: #{e.message}"
end
