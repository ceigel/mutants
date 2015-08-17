class Task < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 100}
  validates :name, uniqueness: {scope: :team_id, case_sensitive: false}
  belongs_to :team
end
