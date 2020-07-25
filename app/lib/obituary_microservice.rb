require_relative '../poros/nytimes_results.rb'
require_relative '../serializers/obituary_serializer.rb'
require 'jsonapi-serializers'


class ObituaryMicroservice < Sinatra::Base
  get '/' do
    obituaries = NytimesResults.new.get_obituaries
    ObituarySerializer.new.format_obituaries(obituaries).to_json
  end
end
