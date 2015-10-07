class Student < ActiveRecord::Base
  has_secure_password
  belongs_to :teacher
  has_many :grades
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
