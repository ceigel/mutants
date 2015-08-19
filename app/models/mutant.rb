class Mutant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  validates :name, presence: true, length: {maximum: 100}
  validates :name, uniqueness: {case_sensitive: false}
  has_and_belongs_to_many :teams
  has_many :tasks, through: :teams

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
