class Person < ApplicationRecord
  validates :age, :death_probability, :number_of_lives, :life_expectancy, :gender, presence: true
  enum gender: [:male, :female]
end
