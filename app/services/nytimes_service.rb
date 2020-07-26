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

  def get_obituaries_by_name(name)
    response = conn.get do |req|
      req.params['fq'] = "headline:(#{name}) AND section_name:(obituaries)"
      req.params['sort'] = 'relevance'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_covid_obituaries
    response = conn.get do |req|
      req.params['fq'] = 'section_name:(obituaries)'
      req.params['q'] = 'coronavirus'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_obituaries_by_date(beginning_date, ending_date)
    response = conn.get do |req|
      req.params['fq'] = "section_name:(obituaries)"
      req.params['facet_fields'] = 'pub_year'
      req.params['facet'] = 'true'
      req.params['begin_date'] = "#{beginning_date}"
      req.params['ending_date'] = "#{ending_date}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url:'https://api.nytimes.com/svc/search/v2//articlesearch.json') do |f|
      f.params['api-key'] = ENV['NYT_API_KEY']
    end
  #  JSON.parse(response.body, symbolize_names: true)
  end
end
