require 'bundler'
Bundler.require :default, :test
require_relative '../lib/obituary_microservice.rb'

class ObituaryTest < Minitest::Test
	include Rack::Test::Methods

	def app
    ObituaryMicroservice.new
	end

  def test_it_returns_a_200
  	get '/'
  	assert last_response.ok?
  end

  def test_it_returns_formatted_obituaries_json
  	get '/'
  	assert_equal 'obituary', JSON.parse(last_response.body).first['data']['type']
  end
end
