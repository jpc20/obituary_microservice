require 'faraday'
require 'json'

class NytimesService
  def get_obituaries
    response = conn.get do |req|
      req.params['fq'] = 'news_desk:("obituaries")'
      req.params['fq'] = 'section_name:("obituaries")'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url:'https://api.nytimes.com/svc/search/v2//articlesearch.json') do |f|
      f.params['api-key'] = ENV['NYT_API_KEY']
    end
  end

end
