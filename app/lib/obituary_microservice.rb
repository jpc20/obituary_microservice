require_relative '../poros/nytimes_results.rb'
require_relative '../serializers/obituary_serializer.rb'

class ObituaryMicroservice < Sinatra::Base
  get '/' do
    obituaries = NytimesResults.new.get_obituaries
    ObituarySerializer.new.format_obituaries(obituaries).to_json
  end

  get "/covid" do

    obituaries = NytimesResults.new.get_covid_obituaries

    ObituarySerializer.new.format_obituaries(obituaries).to_json

  end

  get '/date' do
    obituaries = NytimesResults.new.get_obituaries_by_date(params[:beginning_date], params[:ending_date])
    ObituarySerializer.new.format_obituaries(obituaries).to_json
  end

  get '/name' do
    obituaries = NytimesResults.new.get_obituaries_by_name(params[:name])
    ObituarySerializer.new.format_obituaries(obituaries).to_json
  end

  get '/recent' do
    obituaries = NytimesResults.new.get_most_recent_obituaries
    ObituarySerializer.new.format_obituaries(obituaries).to_json
  end

  get '/advanced' do
    obituaries = NytimesResults.new.get_advanced_obituaries(params[:name], params[:date])
    ObituarySerializer.new.format_obituaries(obituaries).to_json
  end
end
