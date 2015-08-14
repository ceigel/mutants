class Mutant < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 100}
  validates :name, uniqueness: true
  has_and_belongs_to_many :teams
end
