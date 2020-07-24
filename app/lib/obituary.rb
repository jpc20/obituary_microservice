require 'rubygems'
require 'bundler'

Bundler.require
class Obituary < Sinatra::Base
  get '/' do
    Faraday.new(url:'https://api.nytimes.com/svc/search/v2//articlesearch.json') do |f|
      f.params['api-key'] = 'k1ik4Hbr829LbadBkOsfkOMX0WpSTEgR'
      # ENV['NYT_API_KEY']
      f.params['fq'] = 'news_desk:("obituaries")'
      f.params['fq'] = 'section_name:("obituaries")'
    end.get().body
  end
end
