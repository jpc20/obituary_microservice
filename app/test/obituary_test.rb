require 'bundler'
Bundler.require :default, :test
require_relative '../lib/obituary.rb'

class ObituaryTest < Minitest::Test
	include Rack::Test::Methods

	def app
    Obituary.new
	end

  def test_it_returns_a_200
  	get '/'
  	assert last_response.ok?
  end

  def test_it_returns_obituaries_json
  	get '/'
  	assert_equal 'Obituaries', JSON.parse(last_response.body)['response']['docs'].first['section_name']
  end
end
