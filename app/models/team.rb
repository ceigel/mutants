class Team < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 100}
  validates :name, uniqueness: {case_sensitive: false}
  has_and_belongs_to_many :mutants
  has_many :tasks, dependent: :destroy
end
