# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'httparty'
require 'nokogiri'
require 'byebug'

puts 'about to start seeding'

base_url = 'https://www.ssa.gov/oact/STATS/table4c6.html'
page = HTTParty.get(base_url)  # do error handling
parsed_page = Nokogiri::HTML(page)
life_table_data = []

table_rows = parsed_page.css("table.t tbody").css('tr')

(0..119).each do |n|

  row_data = table_rows[n].css('td').text.strip.split(' ')
  age = row_data[0]
  male = {
    age: age.to_i,
    death_probability: row_data[1].to_f,
    number_of_lives: row_data[2].to_i,
    life_expectancy: row_data[3].to_f,
    gender: 'male'
  }
  life_table_data << male
  female = {
    age: age.to_i,
    death_probability: row_data[4].to_f,
    number_of_lives: row_data[5].to_i,
    life_expectancy: row_data[6].to_f,
    gender: 'female'

  }
  life_table_data << female
end

People = Person.create(life_table_data)

puts 'seeding complete'
