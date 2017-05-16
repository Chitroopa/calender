require("bundler/setup")
Bundler.require(:default)
require("pry")

ENV['RACK_ENV'] = 'test'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
# months_ago => to navigate before
# months_since=> to navigate after
  @count = 0
  @starting_date = Time.now.months_since(@count).to_date
  @month = Date::MONTHNAMES[@starting_date.month]
  @simple_calendar = Calendar.new(@starting_date).to_a
  erb(:index)
end

get('/previous_month/:counter') do
  @count = params[:counter].to_i - 1
  @starting_date = Time.now.months_since(@count).to_date
  @month = Date::MONTHNAMES[@starting_date.month]
  @simple_calendar = Calendar.new(@starting_date).to_a
  erb(:index)
end

get('/next_month/:counter') do
  @count = params[:counter].to_i + 1
  @starting_date = Time.now.months_since(@count).to_date
  @month = Date::MONTHNAMES[@starting_date.month]
  @simple_calendar = Calendar.new(@starting_date).to_a
  erb(:index)
end
