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
      name: obituary_data[:headline][:main].split(/[,;]/).first,
      age: obituary_data[:headline][:main].split(/[,;)]/).find{ |attr| attr.to_i > 0 }.to_i
    }
  end
end
