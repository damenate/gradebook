class Student < ActiveRecord::Base
  has_secure_password
  belongs_to :teacher
  has_many :grades
  has_many :parents
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
