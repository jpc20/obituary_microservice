require_relative '../services/nytimes_service.rb'
require_relative './obituary.rb'

class NytimesResults
  def get_obituaries
    json = NytimesService.new.get_obituaries    
    json[:response][:docs].map do |obituary_data|
      Obituary.new(format_obituary_data(obituary_data))
    end
  end

  private
  def format_obituary_data(obituary_data)
    {
      headline: obituary_data[:headline][:main],
      abstract: obituary_data[:abstract],
      web_url: obituary_data[:web_url],
      pub_date: obituary_data[:pub_date],
      word_count: obituary_data[:word_count]
    }
  end
end
