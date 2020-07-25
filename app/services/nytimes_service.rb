require 'faraday'
require 'json'

class NytimesService
  def get_obituaries
    JSON.parse(conn.get.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url:'https://api.nytimes.com/svc/search/v2//articlesearch.json') do |f|
      f.params['api-key'] = ENV['NYT_API_KEY']
      f.params['fq'] = 'news_desk:("obituaries")'
      f.params['fq'] = 'section_name:("obituaries")'
    end
  end

end
