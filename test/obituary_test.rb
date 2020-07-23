require 'bundler'
Bundler.require :default, :test
require_relative '../lib/obituary.rb'

# the above three lines are an alternative to:
# require_relative '../lib/app.rb'
# require 'sinatra/base'
# require 'minitest/autorun'
# require 'rack/test'


class ObituaryTest < Minitest::Test
	include Rack::Test::Methods
end
