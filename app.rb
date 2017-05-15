require("bundler/setup")
Bundler.require(:default)
require("pry")

ENV['RACK_ENV'] = 'test'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
# months_ago => to navigate before
# months_since=> to navigate after
  starting_date = Time.now.months_since(2).to_date
  @simple_calendar = Calendar.new(starting_date).to_a
  erb(:index)
end
