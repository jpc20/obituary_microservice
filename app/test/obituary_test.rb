require 'bundler'
Bundler.require :default, :test
require_relative '../lib/obituary_microservice.rb'

class ObituaryTest < Minitest::Test
	include Rack::Test::Methods

	def app
    ObituaryMicroservice.new
	end

  def test_it_returns_a_200
  	get '/api/v1/'
  	assert last_response.ok?
  end

  def test_it_returns_formatted_obituaries_json
	  get '/api/v1/'
	  assert_equal 'obituary', JSON.parse(last_response.body).first['data']['type']
	end

	def test_it_returns_formatted_covid_obituaries_json
		get '/api/v1/covid'
		assert_equal 'obituary', JSON.parse(last_response.body).first['data']['type']
	end

	def test_it_returns_formatted_obituary_data_by_name
		get '/api/v1/name', name: "George"
		assert_equal "obituary", JSON.parse(last_response.body).first['data']['type']
	end

	def test_it_returns_formatted_obituary_data_by_date
		get '/api/v1/date', beginning_date: '20170101', ending_date: '20190101'
		assert_equal "obituary", JSON.parse(last_response.body).first['data']['type']
	end

	def test_returns_most_recent_obituaries
		get '/api/v1/recent'
		assert_equal "obituary", JSON.parse(last_response.body).first['data']['type']
	end

	def test_advanced_search
		get '/api/v1/advanced', name: 'George', date: 2019
		assert_equal "obituary", JSON.parse(last_response.body).first['data']['type']
	end

	def test_advanced_search_by_year
		get '/api/v1/advanced/year', date: 2019
		assert_equal "obituary", JSON.parse(last_response.body).first['data']['type']
	end
end
