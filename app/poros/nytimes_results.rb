require_relative '../services/nytimes_service.rb'
require_relative './obituary.rb'

class NytimesResults
  def get_obituaries
    parsed_json = NytimesService.new.get_obituaries
    data_to_obituaries(parsed_json)
  end

  def get_covid_obituaries
    parsed_json = NytimesService.new.get_covid_obituaries
    data_to_obituaries(parsed_json)

  end

  def get_obituaries_by_name(name)
    parsed_json = NytimesService.new.get_obituaries_by_name(name)
    data_to_obituaries(parsed_json)
  end

  def get_obituaries_by_date(beginning_date, ending_date)
    parsed_json = NytimesService.new.get_obituaries_by_date(beginning_date, ending_date)
    data_to_obituaries(parsed_json)
  end

  def get_most_recent_obituaries
    parsed_json = NytimesService.new.get_most_recent_obituaries
    data_to_obituaries(parsed_json)
  end

  def get_advanced_obituaries(name, date)
    parsed_json = NytimesService.new.get_advanced_obituaries(name, date)
    data_to_obituaries(parsed_json)
  end

  def get_obituaries_by_year(date)
    parsed_json = NytimesService.new.get_obituaries_by_year(date)
    data_to_obituaries(parsed_json)
  end

  private

  def data_to_obituaries(parsed_json)
    parsed_json[:response][:docs].map do |obituary_data|
      Obituary.new(format_obituary_data(obituary_data))
    end
  end

  def format_obituary_data(obituary_data)
    {
      headline: obituary_data[:headline][:main],
      abstract: obituary_data[:abstract],
      web_url: obituary_data[:web_url],
      pub_date: obituary_data[:pub_date],
      word_count: obituary_data[:word_count],
      image: obituary_data[:multimedia]
    }
  end
end
