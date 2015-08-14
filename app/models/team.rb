class Team < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 100}
  validates :name, uniqueness: true
end
