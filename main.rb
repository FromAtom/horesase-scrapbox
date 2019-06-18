require 'net/http'
require 'uri'
require 'json'

require_relative 'page'

ENDPOINT = 'http://horesase.github.io/horesase-boys/meigens.json'.freeze
uri = URI.parse(ENDPOINT)
json = Net::HTTP.get(uri)
result = JSON.parse(json, symbolize_names: true)

pages = []
result.each do |item|
  page = Page.new item
  pages << page.generate_hash_for_scrapbox
end

data = {
  pages: pages
}

File.write('output.json', data.to_json)
