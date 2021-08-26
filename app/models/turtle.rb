class Turtle < ApplicationRecord
  validates :name, :age, :enjoys, presence: true
end
